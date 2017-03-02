//
//  Question.swift
//  StackOverflow
//
//  Created by Nina Mutty on 2/26/17.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class Question {
    //MARK: Propterties
    var title: String
    var isAnswered: Bool?
    var tags: [String]
    var answerCount: Int
//    var id: Int?
//    var date: Date
    
    init(title: String, isAnswered: Bool?, tags: [String], answerCount: Int) {
        self.title = title
        self.isAnswered = isAnswered
        self.tags = tags
        self.answerCount = answerCount
//        self.id = id
//        self.date = date
    }
}
