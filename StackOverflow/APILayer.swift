import Foundation

internal class APILayer {
    let baseURL: String
//    internal var questionData = [Question]()
    internal var jsonResponse: [String: Any]?
    
    init(baseURL: String = "https://api.stackexchange.com/2.2/questions") {
        self.baseURL = baseURL
    }
    
    internal func fetchQuestions(completion: @escaping ([Question]) -> Void) {
        let url = URL(string: "\(baseURL)?pagesize=50&order=desc&sort=activity&tagged=Objective-C&site=stackoverflow")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            var questionData = [Question]()

            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                        self.jsonResponse = json
                        let questionItems = self.jsonResponse?["items"] as! [[String: Any]]
                        
                        for response in questionItems {
                            let title = response["title"] as! String
                            let isAnswered = response["is_answered"] as! Bool?
                            let tags = response["tags"] as! [String]
                            let answerCount = response["answer_count"] as! Int
                            let questionID = response["question_id"] as! Int
                            //GET DATE
                            let question = Question(title: title, isAnswered: isAnswered, tags: tags, answerCount: answerCount, questionID: questionID)
                            questionData.append(question)
                        }
                    }
                } catch {
                    print("error in JSONSerialization")
                }
            }
            completion(questionData)
        })
    
        task.resume()
    }
    
    internal func fetchOneQuestion(question: Question, questionID: Int, completion: @escaping ([Answer]) -> Void) {
        let url = URL(string: "\(baseURL)/\(questionID)/answers?site=stackoverflow&filter=withbody")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let question = question
        
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            var answerData = [Answer]()
            
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                        self.jsonResponse = json
                        let answerItems = self.jsonResponse?["items"] as! [[String: Any]]
                        
                        for response in answerItems {
                            let answerBody = response["body"] as! String
                            let ownerInfo = response["owner"] as! [String: Any]
                            let score = response["score"] as! Int
                            let isAccepted = response["is_accepted"] as! Bool
                            let answerID = response["answer_id"] as! Int
                            let questionID = response["question_id"] as! Int

                            //GET DATE
                            let answer = Answer(answerBody: answerBody, ownerInfo: ownerInfo, score: score, isAccepted: isAccepted, answerID: answerID, questionID: questionID)
                            answerData.append(answer)
                        }
                    }
                } catch {
                    print("error in JSONSerialization")
                }
            }
            completion(answerData)
        })
        task.resume()
    }

}

