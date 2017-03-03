//import UIKit

class Question {
    //MARK: Propterties
    var title: String
    var isAnswered: Bool?
    var tags: [String]
    var answerCount: Int
    var questionID: Int
//    var date: Date
    
    init(title: String, isAnswered: Bool?, tags: [String], answerCount: Int, questionID: Int) {
        self.title = title
        self.isAnswered = isAnswered
        self.tags = tags
        self.answerCount = answerCount
        self.questionID = questionID
//        self.date = date
    }
}
