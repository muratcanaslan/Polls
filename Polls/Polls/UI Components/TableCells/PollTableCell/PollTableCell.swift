//
//  PollTableCell.swift
//  Polls
//
//  Created by Murat Can ASLAN on 28.03.2024.
//

import UIKit

final class PollTableCell: BaseTableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var profileNameLabel: UILabel!
    @IBOutlet private weak var publishedTimeLabel: UILabel!
    @IBOutlet private weak var lastVotedLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var totalVoteLabel: UILabel!
    @IBOutlet private weak var answerStackView: UIStackView!
    
    //MARK: - Configure
    func configure(with model: PollTableCellViewModel) {
        self.profileImage.image = model.profileImage
        self.profileNameLabel.text = model.profileName
        self.publishedTimeLabel.text = model.publishedTime
        self.lastVotedLabel.text = model.lastVotedTime
        self.questionLabel.text = model.question.questionTitle
        self.totalVoteLabel.text = model.totalVotesDescription
        
        if model.createdOption { return }
        switch model.question.answer {
        case .text:
            model.createdOption = true
            for answer in model.textAnswers {
                let view = TextAnswerView()
                view.configure(with: answer)
                answerStackView.addArrangedSubview(view)

                answer.onSelected = { textAnswer in
                    if let selectedTextAnswer = model.selectedTextAnswer {
                        if textAnswer.answerId == selectedTextAnswer.answerId {
                            model.textAnswers.forEach({ $0.isHaveSelectedAnswer = false})
                            model.textAnswers.forEach({ $0.isSelected = false})
                            model.selectedTextAnswer = nil
                            model.totalVotes -= 1
                            model.textAnswers.forEach({ $0.totalVotedCount = model.totalVotes})
                            textAnswer.answeredCount -= 1
                            self.totalVoteLabel.text = model.totalVotesDescription
                            model.textAnswers.forEach({ $0.onUpdateRating?() })
                        } else {
                            model.textAnswers.forEach({ $0.isHaveSelectedAnswer = true})
                            model.textAnswers.forEach({ $0.isSelected = false})
                            model.selectedTextAnswer?.answeredCount -= 1
                            model.selectedTextAnswer = textAnswer
                            textAnswer.answeredCount += 1
                            textAnswer.isSelected = true
                            model.textAnswers.forEach({ $0.onUpdateRating?() })
                        }
                    } else {
                        model.textAnswers.forEach({ $0.isHaveSelectedAnswer = true})
                        model.textAnswers.forEach({ $0.isSelected = false})
                        model.selectedTextAnswer = textAnswer
                        textAnswer.isSelected = true
                        model.totalVotes += 1
                        model.textAnswers.forEach({ $0.totalVotedCount = model.totalVotes})
                        textAnswer.answeredCount += 1
                        self.totalVoteLabel.text = model.totalVotesDescription
                        model.textAnswers.forEach({ $0.onUpdateRating?() })
                    }
                }
            }
        case .images:
            model.createdOption = true
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 6
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            
            for (index, answer) in model.imageAnswers.enumerated() {
                if index == 0 || index == 1 {
                    let view = ImageAnswerView()
                    view.configure(with: answer)
                    stackView.addArrangedSubview(view)
                    answerStackView.addArrangedSubview(stackView)
                }
                if index == 2 {
                    let view = ImageAnswerView()
                    view.configure(with: answer)
                    answerStackView.addArrangedSubview(view)
                    
                }
                answer.onSelected = { imageAnswer in
                    if let selectedImageAnswer = model.selectedImageAnswer {
                        if imageAnswer.answerId == selectedImageAnswer.answerId {
                            model.imageAnswers.forEach({ $0.isHaveSelectedAnswer = false})
                            model.imageAnswers.forEach({ $0.isSelected = false})
                            model.selectedImageAnswer = nil
                            model.totalVotes -= 1
                            model.imageAnswers.forEach({ $0.totalVotes = model.totalVotes})
                            imageAnswer.answeredCount -= 1
                            self.totalVoteLabel.text = model.totalVotesDescription
                            model.imageAnswers.forEach({ $0.onUpdateRating?() })
                        } else {
                            model.imageAnswers.forEach({ $0.isHaveSelectedAnswer = true})
                            model.imageAnswers.forEach({ $0.isSelected = false})
                            model.selectedImageAnswer?.answeredCount -= 1
                            model.selectedImageAnswer = imageAnswer
                            imageAnswer.answeredCount += 1
                            imageAnswer.isSelected = true
                            model.imageAnswers.forEach({ $0.onUpdateRating?() })
                        }
                    } else {
                        model.imageAnswers.forEach({ $0.isHaveSelectedAnswer = true})
                        model.imageAnswers.forEach({ $0.isSelected = false})
                        model.selectedImageAnswer = imageAnswer
                        imageAnswer.isSelected = true
                        model.totalVotes += 1
                        model.imageAnswers.forEach({ $0.totalVotes = model.totalVotes})
                        imageAnswer.answeredCount += 1
                        self.totalVoteLabel.text = model.totalVotesDescription
                        model.imageAnswers.forEach({ $0.onUpdateRating?() })
                    }
                }
            }
        }
    }
}



