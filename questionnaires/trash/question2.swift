//
//  question1.swift
//  questionnaires
//
//  Created by Myo Thura Zaw on 8/3/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class Question2: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var questionType: String = ""
    var data: [String: String] = ["": ""]
    
    var hiddenAnswer: String = ""
    var optionsArray: [String] = []
    var userChoice: String = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Label: UILabel!
    @IBOutlet weak var option2Label: UILabel!
    @IBOutlet weak var option3Label: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pickerViewAnswer: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10.0
        
//        questionLabel.frame.size = questionLabel.intrinsicContentSize

        switch questionType {
        case "general":
            data = [
                "question": "Who is the president of United States in 2019?",
                "option1": "Barack Obama",
                "option2": "Bill Clinton",
                "option3": "Donald Trump",
                "answer": "Donald Trump"
            ]
        case "programming":
            data = [
                "question": "Which library/framework is for JavaScript?",
                "option1": "Entity Framework",
                "option2": "jQuery",
                "option3": "XNA",
                "answer": "jQuery"
            ]
        case "celebrity":
            data = [
                "question": "Which country produced the series 'Descendents of the Sun?'",
                "option1": "Taiwan",
                "option2": "USA",
                "option3": "Korea",
                "answer": "Korea"
            ]
        default:
            data = ["": ""]
        }

        optionsArray.append((data["option1"])!)
        optionsArray.append((data["option2"])!)
        optionsArray.append((data["option3"])!)

        questionLabel.text = data["question"]
        option1Label.text = data["option1"]
        option2Label.text = data["option2"]
        option3Label.text = data["option3"]
        hiddenAnswer = data["answer"]!

        pickerViewAnswer.delegate = self
        pickerViewAnswer.dataSource = self

        userChoice = optionsArray[0]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return optionsArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userChoice = optionsArray[row]
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if userChoice == hiddenAnswer {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.totalScore += 1
        }

        performSegue(withIdentifier: "question3segue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let vc = segue.destination as? Question3
        vc?.questionType = questionType
    }
}
