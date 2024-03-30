//
//  TextAnswer.swift
//  Polls
//
//  Created by Murat Can ASLAN on 28.03.2024.
//

import Foundation

final class TextAnswer {
    var onSelectedUpdateUI: (() -> Void)?
    var onSelected: ((TextAnswer) -> Void)?
    var isHaveSelectedAnswer: Bool = false
    var onUpdateRating: (() -> Void)?
    
    let answerId: Int
    let optionCharacter: String
    let optionAnswer: String
    var answeredCount: Int
    var totalVotedCount: Int
    
    var isSelected: Bool {
        didSet {
            onSelectedUpdateUI?()
        }
    }
    
    init(
        answerId: Int,
        optionCharacter: String,
        optionAnswer: String,
        answeredCount: Int,
        isSelected: Bool = false,
        totalVotedCount: Int
    ) {
        self.answerId = answerId
        self.optionAnswer = optionAnswer
        self.optionCharacter = optionCharacter
        self.answeredCount = answeredCount
        self.isSelected = isSelected
        self.totalVotedCount = totalVotedCount
    }
    
    init() {
        optionAnswer = ""
        optionCharacter = ""
        answeredCount = 0
        isSelected = false
        answerId = 0
        totalVotedCount = 0
    }
    
    func calculateRating() -> String {
        let percentage = Double(answeredCount) / Double(totalVotedCount) * 100.0
        return String(format: "%.2f", percentage)
    }
}
