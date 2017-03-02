import UIKit

class QuestionTableViewController: UITableViewController {
    
    //MARK: Properties
    let apiLayer = APILayer()
    var cellText: String? = nil
    var questionList = [Question]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        apiLayer.fetchQuestions(completion: { questions in
            self.setQuestionList(questions)
        })
    }
    
    internal func setQuestionList(_ questions: [Question]) {
        self.questionList = questions
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.questionList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as! QuestionTableViewCell
        
        let row = indexPath.row
        cell.questionTitle.text = self.questionList[row].title
//        cell.questionTitle.font = UIFont(name: "AppleSDGothicNeo", size: 8.0)
//        cell.questionTitle = UIFontTextStyle.headline
        
        if self.questionList[row].isAnswered == true {
            let count = self.questionList[row].answerCount
            let singular = "\(count) Answer"
            let plural = "\(count) Answers"
            if count > 1 {
                cell.isAnswered.text = plural
            } else {
                cell.isAnswered.text = singular
            }
        } else {
            cell.isAnswered.text = "Not Answered"
        }
        
        cell.tags.text = ""
        let tags = self.questionList[row].tags
        for tag in tags {
            if tag != tags[tags.endIndex - 1] {
                cell.tags.text = cell.tags.text! + "\(tag), "
            } else {
                cell.tags.text = cell.tags.text! + "\(tag)"
            }
        }
        
        return cell
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
