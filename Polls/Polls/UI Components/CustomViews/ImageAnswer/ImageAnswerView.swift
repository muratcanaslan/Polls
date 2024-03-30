//
//  ImageAnswerView.swift
//  Polls
//
//  Created by Murat Can ASLAN on 30.03.2024.
//

import UIKit

final class ImageAnswerView:  BaseView {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var imageAnswerView: UIImageView!
    @IBOutlet private weak var iconSelected: UIImageView!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    //MARK: - Properties
    private var model = ImageAnswer()
    
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
    func configure(with model: ImageAnswer) {
        self.model = model
        
        self.imageAnswerView.image = model.imageAnswer
        self.imageAnswerView.roundCorners(model.cornerType)
        
        model.onSelectedUpdateUI = {
            self.setSelectedUI(model.isSelected)
        }
        
        model.onUpdateRating = {
            self.ratingLabel.text = "%\(model.calculateRating())"
        }
    }
    
    //MARK: - UI Helpers
    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapAnswer))
        addGestureRecognizer(gesture)
    }
    
    private func setSelectedUI(_ selected: Bool) {
        iconSelected.isHidden = !selected
        
        if selected {
            ratingLabel.isHidden = false
        } else {
            ratingLabel.isHidden  = !model.isHaveSelectedAnswer
        }
    }
    
    //MARK: - IBActions
    @objc private func onTapAnswer() {
        model.onSelected?(model)
    }
    
    
}

enum CornerType {
    case leftTop
    case rightTop
    case leftRightBottom
}

extension UIView {
    func roundCorners(_ corners: CornerType, radius: CGFloat = 12) {
        var maskedCorners: CACornerMask = []
        switch corners {
        case .leftTop:
            maskedCorners.insert(.layerMinXMinYCorner)
        case .rightTop:
            maskedCorners.insert(.layerMaxXMinYCorner)
        case .leftRightBottom:
            maskedCorners.insert(.layerMinXMaxYCorner)
            maskedCorners.insert(.layerMaxXMaxYCorner)
        }
        
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = maskedCorners
        self.layer.masksToBounds = true
    }
}
