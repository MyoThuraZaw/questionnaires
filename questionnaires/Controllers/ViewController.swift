//
//  ViewController.swift
//  questionnaires
//
//  Created by Myo Thura Zaw on 8/3/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questionType: String = ""

    @IBOutlet weak var generalQuestionsButton: UIButton!
    
    @IBOutlet weak var programmingQuestionsButton: UIButton!
    
    @IBOutlet weak var CelebrityQuestionsButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        switch sender.tag {
        case 1:
            questionType = "general"
        case 2:
            questionType = "programming"
        case 3:
            questionType = "celebrity"
        default:
            print("No action")
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let nextQuestionVC = storyBoard.instantiateViewController(withIdentifier: "qtype") as! Question1
        
        nextQuestionVC.setup(type: questionType)
        
        present(nextQuestionVC, animated: true, completion: nil)
       
       // performSegue(withIdentifier: "question1segue", sender: self)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let vc = segue.destination as? Question1
//        vc?.questionType = questionType
//    }
    
    func initialSetup() {
        let buttonRadius: CGFloat = 10.0
        generalQuestionsButton.layer.cornerRadius = buttonRadius
        programmingQuestionsButton.layer.cornerRadius = buttonRadius
        CelebrityQuestionsButton.layer.cornerRadius = buttonRadius
        
    }
    
}

