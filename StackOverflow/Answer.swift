class Answer {
    //MARK: Properties
    var answerBody: String
    var ownerInfo: [String: Any]
    var score: Int
    var isAccepted: Bool
    var answerID: Int
    var questionID: Int
    
    init(answerBody: String, ownerInfo: [String: Any], score: Int, isAccepted: Bool, answerID: Int, questionID: Int) {
        self.answerBody = answerBody
        self.ownerInfo = ownerInfo
        self.score = score
        self.isAccepted = isAccepted
        self.answerID = answerID
        self.questionID = questionID
    }
}
