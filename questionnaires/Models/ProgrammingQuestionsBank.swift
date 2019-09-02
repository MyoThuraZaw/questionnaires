//
//  QuestionsBank.swift
//  questionnaires
//
//  Created by Myo Thura Zaw on 8/4/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class ProgrammingQuestionsBank {
    var programmingQuestions = [Question]()
    
    init() {
        let item = Question(
            question: "Which programming language is the most widely used in 2019?",
            option1: "Swift",
            option2: "Python",
            option3: "JavaScript",
            answer: "JavaScript"
        )
        programmingQuestions.append(item)
        
        programmingQuestions.append(Question(
            question: "Which library/framework is for JavaScript?",
            option1: "Entity Framework",
            option2: "jQuery",
            option3: "XNA",
            answer: "jQuery"
        ))
        
        programmingQuestions.append(Question(
            question: "Which framework is used to build Visual Studio Code?",
            option1: "Angular",
            option2: "Electron",
            option3: "Bootstrap",
            answer: "Electron"
        ))
        
    }
}
