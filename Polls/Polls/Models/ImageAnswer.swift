//
//  ImageAnswer.swift
//  Polls
//
//  Created by Murat Can ASLAN on 28.03.2024.
//

import UIKit

final class ImageAnswer {
    let answerId: Int
    var onSelectedUpdateUI: (() -> Void)?
    var onSelected: ((ImageAnswer) -> Void)?
    var isHaveSelectedAnswer: Bool = false
    var onUpdateRating: (() -> Void)?

    let imageAnswer: UIImage
    var answeredCount: Int
    var totalVotes: Int
    var cornerType: CornerType
    
    var isSelected: Bool {
        didSet {
            onSelectedUpdateUI?()
        }
    }
    
    init(totalVotes: Int,
         imageAnswer: UIImage,
         answeredCount: Int,
         cornerType: CornerType,
         isSelected: Bool = false,
         answerId: Int
    ) {
        self.totalVotes = totalVotes
        self.imageAnswer = imageAnswer
        self.answeredCount = answeredCount
        self.cornerType = cornerType
        self.isSelected = isSelected
        self.answerId = answerId
    }
    
    init() {
        self.imageAnswer = .init(resource: .chair1)
        self.answeredCount = 0
        self.totalVotes = 0
        self.cornerType = .leftRightBottom
        self.isSelected = false
        self.answerId = 0
    }
    
    func calculateRating() -> String {
        let percentage = Double(answeredCount) / Double(totalVotes) * 100.0
        return String(format: "%.2f", percentage)
    }
}
