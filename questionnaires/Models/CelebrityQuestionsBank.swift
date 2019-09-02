//
//  QuestionsBank.swift
//  questionnaires
//
//  Created by Myo Thura Zaw on 8/4/19.
//  Copyright © 2019 Myo Thura Zaw. All rights reserved.
//

import UIKit

class CelebrityQuestionsBank {
    var celebrityQuestions = [Question]()
    
    init() {
        let item = Question(
            question: "Who is the highest paid Hollywood actor in 2019?",
            option1: "Chris Hemsworth",
            option2: "Dwayne Johnson",
            option3: "Brad Pitt",
            answer: "Dwayne Johnson"
        )
        celebrityQuestions.append(item)
        
        celebrityQuestions.append(Question(
            question: "Which country produced the series 'Descendents of the Sun?'",
            option1: "Taiwan",
            option2: "USA",
            option3: "Korea",
            answer: "Korea"
        ))
        
        celebrityQuestions.append(Question(
            question: "Whos is the main actor in Harry Potter?",
            option1: "Matthew Lewis",
            option2: "Daniel Radcliffe",
            option3: "Johnny Depp",
            answer: "Daniel Radcliffe"
        ))
        
    }
}
