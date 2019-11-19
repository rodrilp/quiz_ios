//
//  QuizViewController.swift
//  Practica4 clase
//
//  Created by Rodrigo Lopez on 14/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quiz: QuizItem!
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var ansLabel: UILabel!
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var quizAuthor: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        quizLabel.text = quiz.question
        ansLabel.text = quiz.answer
        quizAuthor.text = quiz.author?.username
        quizImage.image = UIImage(named: "none")!
        if let url = quiz.attachment?.url{
            quizImage.image = image(url: url)
        }
        authorImage.image = UIImage(named: "none")!
        if let url1 = quiz.author?.photo?.url{
            authorImage.image = image(url: url1)
        }
    }
    /*@IBSegueAction func segueToView(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> QuizViewController? {
        
        return
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
