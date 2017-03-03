//
//  QuestionTableViewCell.swift
//  StackOverflow
//
//  Created by Nina Mutty on 2/26/17.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    //Mark: Properties
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var isAnswered: UILabel!
    @IBOutlet weak var tags: UILabel!
    var questionID: Int!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
