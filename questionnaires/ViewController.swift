//
//  ViewController.swift
//  questionnaires
//
//  Created by Myo Thura Zaw on 8/3/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data: String = ""

    @IBOutlet weak var generalQuestionsButton: UIButton!
    
    @IBOutlet weak var programmingQuestionsButton: UIButton!
    
    @IBOutlet weak var CelebrityQuestionsButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        switch sender.tag {
        case 1:
            data = "general"
        case 2:
            data = "programming"
        case 3:
            data = "celebrity"
        default:
            print("No action")
        }
        
        performSegue(withIdentifier: "question1segue", sender: self)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? Question1
        vc?.questionType = data
        
    }
    
    func initialSetup() {
        let buttonRadius: CGFloat = 10.0
        generalQuestionsButton.layer.cornerRadius = buttonRadius
        programmingQuestionsButton.layer.cornerRadius = buttonRadius
        CelebrityQuestionsButton.layer.cornerRadius = buttonRadius
        
    }
    
}

