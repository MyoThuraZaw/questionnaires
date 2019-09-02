//
//  summary.swift
//  questionnaires
//
//  Created by Myo Thura Zaw on 8/3/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class Summary: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var backToHomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tryAgainButton.layer.cornerRadius = 10.0
        backToHomeButton.layer.cornerRadius = 10.0
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        resultLabel.text = "You got \(appDelegate.totalScore)/3 correct!"
    }
    
    @IBAction func tryAgainButtonPressed(_ sender: UIButton) {
        resetTotalScores()
//        print(navigationController?.viewControllers.count)
//        print(navigationController?.viewControllers)
        
        if let viewControllers = navigationController?.viewControllers{
            for vc in viewControllers {
                if vc is Question1 {
                    navigationController?.popToViewController(vc, animated: true)
                }
            }
        }
        
    }
    
    @IBAction func backToHomeButtonPressed(_ sender: UIButton) {
//        print(navigationController?.viewControllers.count)
//        print(navigationController?.viewControllers)
        resetTotalScores()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func resetTotalScores() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.totalScore = 0
        appDelegate.questionIndex = 0
    }
}
