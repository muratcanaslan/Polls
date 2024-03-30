//
//  TextAnswerView.swift
//  Polls
//
//  Created by Murat Can ASLAN on 28.03.2024.
//

import UIKit

final class TextAnswerView: BaseView {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var optionAnswerLabel: UILabel!
    @IBOutlet private weak var optionCharacterButton: UIButton!
    
    //MARK: - Properties
    private var model = TextAnswer()
    
    //MARK: - Base methods
    override func applyStyling() {
        super.applyStyling()
        
        layer.masksToBounds = true
        ratingLabel.isHidden = true
    }
    override func setupAfterInit() {
        super.setupAfterInit()
        
        setupGesture()
    }
    
    //MARK: - Configure
    func configure(with model: TextAnswer) {
        self.model = model
        
        optionCharacterButton.setTitle(model.optionCharacter, for: .normal)
        optionAnswerLabel.text = model.optionAnswer
        model.onSelectedUpdateUI = {
            self.setSelectedUI(self.model.isSelected)
        }
        
        model.onUpdateRating = {
            self.ratingLabel.text = "%\(model.calculateRating())"
        }
        
    }
    
    //MARK: - UI Helpers
    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapAnswer))
        containerView.addGestureRecognizer(gesture)
    }
    
    private func setSelectedUI(_ selected: Bool) {
        containerView.backgroundColor = selected ? UIColor(resource: .purple) : UIColor(resource: .textAnswerBackground)
        optionAnswerLabel.textColor = selected ? .white : UIColor(resource: .text)
        ratingLabel.textColor = selected ? .tertiary : UIColor(resource: .text)
        ratingLabel.isHidden = !selected
        ratingLabel.textColor = selected ? .white : UIColor(resource: .tertiary)
        if selected {
            ratingLabel.isHidden = false
        } else {
            ratingLabel.isHidden = !model.isHaveSelectedAnswer
        }
    }
    
    //MARK: - IBActions
    @objc private func onTapAnswer() {
        model.onSelected?(model)
    }
}
