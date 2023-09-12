//
//  SettingTableViewCell.swift
//  Notes App
//
//  Created by Mohammed on 9/10/20.
//  Copyright © 2020 Mohammed. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    
    var isRight: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initializerCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initializerCell() {
        print(isRight ?? false)
        if let _isRight = isRight {
            _isRight ? setRightView() : setLeftView()
        }
        
    }
    
    public func setRightView() {
        rightView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        leftView.isHidden = true
    }
    
    public func setLeftView() {
        leftView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        rightView.isHidden = true
    }
}
