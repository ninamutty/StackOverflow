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
    let questionData: [Question]?
    
    init(baseURL: String = "https://api.stackexchange.com/2.2/questions") {
        self.baseURL = baseURL
    }
    
    internal var jsonResponse: [String: Any]?
    
    internal func fetchQuestions() {
        let url = URL(string: "\(self.baseURL)?pagesize=50&order=desc&sort=activity&tagged=Objective-C&site=stackoverflow")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        
        session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!) as? [String: Any] {
                        self.jsonResponse = json
                        for response in self.jsonResponse {
                            //TODO: convert each response to an instance of a question
                            self.questionData?.append(<#T##newElement: Question##Question#>)
                        }
                    }
                } catch {
                    print("error in JSONSerialization")
                }
            }
        }).resume()
    }
}

