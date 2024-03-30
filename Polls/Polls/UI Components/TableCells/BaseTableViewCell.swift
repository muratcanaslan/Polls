//
//  BaseTableViewCell.swift
//  Polls
//
//  Created by Murat Can ASLAN on 28.03.2024.
//

import UIKit
import Reusable

class BaseTableViewCell: UITableViewCell, NibReusable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyStyling()
        applyLocalizations()
        setupAfterInit()
    }
    
    func applyStyling() {}
    func applyLocalizations() {}
    func setupAfterInit() {}
}
