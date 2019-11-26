//
//  QuizzesTableViewController.swift
//  Practica4 clase
//
//  Created by Rodrigo Lopez on 14/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import UIKit

class QuizzesTableViewController: UITableViewController {

    var quiz10model = Quiz10Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiz10model.download()
        tableView.reloadData()
    }

    @IBAction func refreshQuizzes(_ sender: UIBarButtonItem) {
        quiz10model.download()
        tableView.reloadData()
    }
    
    @IBSegueAction func showQuiz(_ coder: NSCoder) -> QuizViewController? {
        let qvc = QuizViewController(coder: coder)
        
        let row = tableView.indexPathForSelectedRow!.row
        qvc!.quiz = quiz10model.quizzes[row]
        
        return qvc
    }
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quiz10model.quizzes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomQuizCell", for: indexPath) as! CustomTableViewCell

        let row = indexPath.row
        let quiz = quiz10model.quizzes[row]
        
        cell.questionLabel.text = quiz.question
        cell.authorLabel.text = quiz.author?.username ?? "Anónimo"
        cell.imageQuestion.image = UIImage(named: "none")
        if let url = quiz.attachment?.url{
            let img = image(url: url)
            cell.imageQuestion.image = img
        }
        
        cell.imageAuthor.layer.masksToBounds = true
        cell.imageAuthor.layer.cornerRadius = cell.imageAuthor.bounds.width / 2
        
        cell.imageAuthor.image = UIImage(named: "none")
        if let url = quiz.author?.photo?.url{
            let imag = image(url: url)
            cell.imageAuthor.image = imag
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
