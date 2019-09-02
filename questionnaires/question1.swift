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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let gQuestions = GeneralQuestionsBank()
    let pQuestions = ProgrammingQuestionsBank()
    let cQuestions = CelebrityQuestionsBank()
    
    func setup(type:String ){
        questionType = type 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10.0

        switch questionType {
        case "general":
            let index = gQuestions.generalQuestions[appDelegate.questionIndex]
            data = [
                "question": index.question,
                "option1": index.option1,
                "option2": index.option2,
                "option3": index.option3,
                "answer": index.answer
            ]
        case "programming":
            let index = pQuestions.programmingQuestions[appDelegate.questionIndex]
            data = [
                "question": index.question,
                "option1": index.option1,
                "option2": index.option2,
                "option3": index.option3,
                "answer": index.answer
            ]
        case "celebrity":
            let index = cQuestions.celebrityQuestions[appDelegate.questionIndex]
            data = [
                "question": index.question,
                "option1": index.option1,
                "option2": index.option2,
                "option3": index.option3,
                "answer": index.answer
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
            
            appDelegate.totalScore += 1
        }
        
        appDelegate.questionIndex += 1
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if (appDelegate.questionIndex < gQuestions.generalQuestions.count) {
            
            let nextQuestionVC = storyBoard.instantiateViewController(withIdentifier: "qtype") as! Question1
            nextQuestionVC.setup(type: questionType)
            present(nextQuestionVC, animated: true, completion: nil)
            
        } else {
            let summaryVC = storyBoard.instantiateViewController(withIdentifier: "summary") as! Summary
            
            present(summaryVC, animated: true, completion: nil)
        }
        
        //performSegue(withIdentifier: "question2segue", sender: self)
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let vc = segue.destination as? Question2
//        vc?.questionType = questionType
//    }
}
