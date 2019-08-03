//
//  question1.swift
//  questionnaires
//
//  Created by Myo Thura Zaw on 8/3/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class Question3: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
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
                "question": "Choose the planet which is not in the solar system.",
                "option1": "Uranus",
                "option2": "Pluto",
                "option3": "Rigel",
                "answer": "Rigel"
            ]
        case "programming":
            data = [
                "question": "Which framework is used to build Visual Studio Code?",
                "option1": "Angular",
                "option2": "Electron",
                "option3": "Bootstrap",
                "answer": "Electron"
            ]
        case "celebrity":
            data = [
                "question": "Whos is the main actor in Harry Potter?",
                "option1": "Matthew Lewis",
                "option2": "Daniel Radcliffe",
                "option3": "Johnny Depp",
                "answer": "Daniel Radcliffe"
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

        performSegue(withIdentifier: "summarysegue", sender: self)
    }

}
