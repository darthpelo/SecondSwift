//
//  ExpandTableViewCell.swift
//  SecondSwift
//
//  Created by Alessio Roberto on 13/06/14.
//  Copyright (c) 2014 Alessio Roberto. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ExpandDelegate {
    func buttonPressed(action: String)->()
}

class ExpandTableViewCell : UITableViewCell {
    // MARK: Properties
    
    weak var delegate: ExpandDelegate?
    
    let tagNameLabel : UILabel
    let rateFirstTarget : UIButton
    let rateSecondTarget : UIButton
    
    init(style: UITableViewCellStyle,
        reuseIdentifier: String!) {
            
            tagNameLabel = UILabel(frame: CGRectMake(10, 10, 280, 34))
            tagNameLabel.font = UIFont(name: "Helvetica", size: 18)
            tagNameLabel.textColor = UIColor.darkTextColor()
            tagNameLabel.backgroundColor = UIColor.whiteColor()
            
            rateFirstTarget = UIButton(frame: CGRectZero)
            rateFirstTarget.setTitle("Rate first target", forState: .Normal)
            rateFirstTarget.tintColor = UIColor.whiteColor()
            rateFirstTarget.backgroundColor = UIColor.darkGrayColor()
            
            rateSecondTarget = UIButton(frame: CGRectZero)
            rateSecondTarget.setTitle("Rate second target", forState: .Normal)
            rateSecondTarget.tintColor = UIColor.whiteColor()
            rateSecondTarget.backgroundColor = UIColor.darkGrayColor()
            
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            rateFirstTarget.addTarget(self, action: Selector.convertFromStringLiteral("ratedFirstTarget:"), forControlEvents: .TouchUpInside)
            rateSecondTarget.addTarget(self, action: Selector.convertFromStringLiteral("ratedSecondTarget:"), forControlEvents: .TouchUpInside)
            
            self.contentView.addSubview(rateFirstTarget)
            self.contentView.addSubview(rateSecondTarget)
            self.contentView.addSubview(tagNameLabel)
    }
    
    override func layoutSubviews() {
        let contentRect = self.contentView.bounds
        let boundsX = contentRect.origin.x
        
        tagNameLabel.frame = CGRectMake(boundsX + 10, 10, 280, 34)
        
        rateFirstTarget.frame = CGRectMake(boundsX + 30, 54, 100, 34);
        
        rateSecondTarget.frame = CGRectMake(rateFirstTarget.frame.size.width + boundsX + 30 + 20, 54, 100, 34)
        
        super.layoutSubviews()
    }
    
    func ratedFirstTarget(sender: UIButton!) {
        println("first target")
        delegate?.buttonPressed("first")
    }
    
    func ratedSecondTarget(sender: UIButton!) {
        println("second target")
        delegate?.buttonPressed("second")
    }
}