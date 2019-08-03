//
//  question1.swift
//  questionnaires
//
//  Created by Myo Thura Zaw on 8/3/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class Question1: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
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

        switch questionType {
        case "general":
            data = [
                "question": "Where is Canada located?",
                "option1": "Asia",
                "option2": "North America",
                "option3": "Europe",
                "answer": "North America"
            ]
        case "programming":
            data = [
                "question": "Which programming language is the most widely used in 2019?",
                "option1": "Swift",
                "option2": "Python",
                "option3": "JavaScript",
                "answer": "JavaScript"
            ]
        case "celebrity":
            data = [
                "question": "Who is the highest paid Hollywood actor in 2019?",
                "option1": "Chris Hemsworth",
                "option2": "Dwayne Johnson",
                "option3": "Brad Pitt",
                "answer": "Dwayne Johnson"
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

        performSegue(withIdentifier: "question2segue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let vc = segue.destination as? Question2
        vc?.questionType = questionType
    }
}
