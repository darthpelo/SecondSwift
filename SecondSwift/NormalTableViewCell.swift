//
//  NormalTableViewCell.swift
//  SecondSwift
//
//  Created by Alessio Roberto on 13/06/14.
//  Copyright (c) 2014 Alessio Roberto. All rights reserved.
//

import Foundation
import UIKit

class NormalTableViewCell : UITableViewCell {
     let tagNameLabel : UILabel
    
    init(style: UITableViewCellStyle,
        reuseIdentifier: String!) {
            
            tagNameLabel = UILabel(frame: CGRectMake(10, 10, 280, 34))
            tagNameLabel.font = UIFont(name: "Helvetica", size: 18)
            tagNameLabel.textColor = UIColor.darkTextColor()
            tagNameLabel.backgroundColor = UIColor.whiteColor()
            
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            self.contentView.addSubview(tagNameLabel)
    }
}

