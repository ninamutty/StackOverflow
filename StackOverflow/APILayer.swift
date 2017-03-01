//
//  APILayer.swift
//  StackOverflow
//
//  Created by Nina Mutty on 2/28/17.
//  Copyright © 2017 Personal. All rights reserved.
//

import Foundation

internal class APILayer {
    let baseURL: String
    internal var questionData: [Question]?
    internal var jsonResponse: [String: Any]?
    
    init(baseURL: String = "https://api.stackexchange.com/2.2/questions") {
        self.baseURL = baseURL
    }
    
    internal func fetchQuestions() {
        let url = URL(string: "\(self.baseURL)?pagesize=50&order=desc&sort=activity&tagged=Objective-C&site=stackoverflow")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                        self.jsonResponse = json
                        let items = self.jsonResponse?["items"] as! [[String: Any]]
                        for aResponse in items {
                            let title = aResponse["title"] as! String
                            let isAnswered = aResponse["is_answered"] as! Bool?
                            let tags = aResponse["tags"] as! [String]
//                            guard let id = aResponse["id"] as! Int? else {
//                                print("error unwrapping id - missed question")
//                                continue
//                            }
//                            let date = aResponse["last_edit_date"] as! Date
                                ///TODO: get date
                          
                            let question = Question(title: title, isAnswered: isAnswered, tags: tags)
                            self.questionData?.append(question)
                        }
                    }
                } catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
    }
}

