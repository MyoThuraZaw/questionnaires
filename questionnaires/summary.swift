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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        resultLabel.text = "You got \(appDelegate.totalScore)/3 correct!"
    }
    
    @IBAction func tryAgainButtonPressed(_ sender: UIButton) {
        resetTotalScores()
        
        if let viewControllers = navigationController?.viewControllers{
            for vc in viewControllers {
                if vc is Question1 {
                    navigationController?.popToViewController(vc, animated: true)
                }
            }
        }
        
    }
    
    @IBAction func backToHomeButtonPressed(_ sender: UIButton) {
        resetTotalScores()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func resetTotalScores() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.totalScore = 0
    }
}
