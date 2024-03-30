//
//  PollTableCellViewModel.swift
//  Polls
//
//  Created by Murat Can ASLAN on 30.03.2024.
//

import UIKit

final class PollTableCellViewModel {
    let pollId: Int
    let profileImage: UIImage
    let profileName: String
    let publishedTime: String
    let lastVotedTime: String
    let question: Question
    var totalVotes: Int
    var selectedImageAnswer: ImageAnswer?
    var imageAnswers: [ImageAnswer]
    var selectedTextAnswer: TextAnswer?
    var textAnswers: [TextAnswer]
    var createdOption: Bool = false
    
    var totalVotesDescription: String {
        "\(totalVotes) total votes"
    }
    
    init(model: Poll) {
        self.pollId = model.pollId
        self.profileImage = Poll.createMockImage()
        self.profileName = Poll.createMockProfileName()
        self.publishedTime = Poll.createMockPublishedTime()
        self.lastVotedTime = Poll.createMockLastVotedTime()
        self.question = model.question
        self.totalVotes = model.totalVotes
        self.imageAnswers = model.imageAnswers
        self.textAnswers = model.textAnswers
        self.selectedTextAnswer = nil
        self.selectedImageAnswer = nil
    }
}
