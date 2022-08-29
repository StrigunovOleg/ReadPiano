//
//  Question.swift
//  ReadPiano
//
//  Created by Олег Стригунов on 02.08.2022.
//

import Foundation


struct Question {
    let text: String
    let response: Response
    
    static let all: [Question] = [
        Question(text: "DO", response: .do),
        Question(text: "RE", response: .re),
        Question(text: "MI", response: .mi),
        Question(text: "FA", response: .fa),
        Question(text: "SOL", response: .sol),
        Question(text: "LY", response: .ly),
        Question(text: "SI", response: .si)
    ]
}

// [] нарисовать схему на доске, как общается респонс и квесчен
