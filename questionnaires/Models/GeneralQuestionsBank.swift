//
//  QuestionsBank.swift
//  questionnaires
//
//  Created by Myo Thura Zaw on 8/4/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class GeneralQuestionsBank {
    var generalQuestions = [Question]()
    
    init() {
        let item = Question(
            question: "Where is Canada located?",
            option1: "Asia",
            option2: "North America",
            option3: "Europe",
            answer: "North America"
        )
        generalQuestions.append(item)
        
        generalQuestions.append(Question(
            question: "Who is the president of United States in 2019?",
            option1: "Barack Obama",
            option2: "Bill Clinton",
            option3: "Donald Trump",
            answer: "Donald Trump"
        ))
        
        generalQuestions.append(Question(
            question: "Choose the planet which is not in the solar system.",
            option1: "Uranus",
            option2: "Pluto",
            option3: "Rigel",
            answer: "Rigel"
        ))
    }
}
