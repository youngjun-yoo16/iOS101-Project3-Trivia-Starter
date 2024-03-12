//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Youngjun Yoo on 3/11/24.
//

import Foundation
import UIKit

struct TriviaQuestion {
    let questionNum: Int
    let topic: topic
}

enum topic {
    case music
    case videoGames
    case history
    
    var topic: String {
        switch self {
        case .music:
            return "Entertainment: Music"
        case .history:
            return "History"
        case .videoGames:
            return "Entertainment: Video Games"
        }
    }
    
    var description: String {
        switch self {
        case .music:
            return "What is the last song on the first Panic! At the Disco album?"
        case .history:
            return "Which of these founding fathers of the United States of America later become president?"
        case .videoGames:
            return "What was the first weapon pack for 'PAYDAY'?"
        }
    }
    
    var answers: [String] {
        switch self {
        case .music:
            return ["I Write Sins Not Tragedies", "Lying Is The Most Fun A Girl Can Have Without Taking Her Clothes Off", "Nails for Breakfast, Tacks for Snacks", "Build God, Then We'll Talk"]
        case .history:
            return ["Roger Sherman", "James Monroe", "Samuel Adams", "Alexander Hamilton"]
        case.videoGames:
            return ["The Gage Weapon Pack #1", "The Overkill Pack", "The Gage Chivalry Pack", "The Gage Historical Pack"]
        }
    }
    
    var correctAnswerIdx: Int {
        switch self {
        case .music:
            return 0
        case .history:
            return 1
        case .videoGames:
            return 0
        }
    }
}
