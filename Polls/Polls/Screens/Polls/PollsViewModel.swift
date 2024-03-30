//
//  PollsViewModel.swift
//  Polls
//
//  Created by Murat Can ASLAN on 28.03.2024.
//

import UIKit

final class PollsViewModel {
    //MOCK DATA
    var cellVMs: [PollTableCellViewModel] = [
        .init(
            model: .init(pollId: 0,
                         question: .init(questionTitle: "I have 3 days off for the next week. How would you spend this 72 hours of freedom.", answer: .text),
                         totalVotes: 20,
                         textAnswers: [
                            .init(answerId: 0,
                                  optionCharacter: "A",
                                  optionAnswer: "Netflix & Chill",
                                  answeredCount: 4,
                                  isSelected: false, 
                                  totalVotedCount: 20
                                 ),
                            .init(answerId: 1,
                                  optionCharacter: "B",
                                  optionAnswer: "Visit Paris.",
                                  answeredCount: 5,
                                  isSelected: false,
                                  totalVotedCount: 20
                                 ),
                            .init(answerId: 2,
                                  optionCharacter: "C",
                                  optionAnswer: "Go camping with your friends.",
                                  answeredCount: 11,
                                  isSelected: false,
                                  totalVotedCount: 20
                                 )
                         ],
                         imageAnswers: [])
        ),
        .init(model: .init(pollId: 3,
                           question: .init(questionTitle: "I am looking for an asthetic chair my backyard. I finally managed to narrow my options down to these three. Whatme know your choice.",
                                           answer: .images),
                           totalVotes: 8,
                           textAnswers: [],
                           imageAnswers: [.init(totalVotes: 8,
                                                imageAnswer: UIImage(resource: .chair1),
                                                answeredCount: 3,
                                                cornerType: .leftTop,
                                                answerId: 0),
                                          .init(totalVotes: 8,
                                                imageAnswer: UIImage(resource: .chair2),
                                                answeredCount: 2,
                                                cornerType: .rightTop,
                                                answerId: 1),
                                          .init(totalVotes: 8,
                                                imageAnswer: UIImage(resource: .chair3),
                                                answeredCount: 3,
                                                cornerType: .leftRightBottom,
                                                answerId: 2)
                           ])
        ),
        .init(model: .init(pollId: 1,
                           question: .init(questionTitle: "My friend just invited me to his birthday party but I have an exam tomorrow.", answer: .text),
                           totalVotes: 10,
                           textAnswers: [.init(answerId: 0,
                                               optionCharacter: "A",
                                               optionAnswer: "This is a no brainer, study!",
                                               answeredCount: 5,
                                               isSelected: false,
                                               totalVotedCount: 10
                                              ),
                                         .init(answerId: 1,
                                               optionCharacter: "B",
                                               optionAnswer: "We only come to life once!",
                                               answeredCount: 5,
                                               isSelected: false,
                                               totalVotedCount: 10
                                              ),
                           ],
                           imageAnswers: [])
        ),
        
            .init(model: .init(pollId: 2,
                               question: .init(questionTitle: "Which is the most elegant", answer: .text),
                               totalVotes: 2,
                               textAnswers: [.init(answerId: 0,
                                                   optionCharacter: "A",
                                                   optionAnswer: "Destiny.",
                                                   answeredCount: 0,
                                                   isSelected: false,
                                                   totalVotedCount: 2
                                                  ),
                                             .init(answerId: 1,
                                                   optionCharacter: "B",
                                                   optionAnswer: "Consequence.",
                                                   answeredCount: 2,
                                                   isSelected: false,
                                                   totalVotedCount: 2
                                                  ),
                               ],
                               imageAnswers: []))
    ]
}
