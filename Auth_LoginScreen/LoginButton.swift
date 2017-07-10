//
//  LoginButton.swift
//  Authentication
//
//  Created by tam on 30/6/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import Foundation
import UIKit

class LoginButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderWidth = 1.0
        //layer.borderColor = tintColor.CGColor
        layer.cornerRadius = 20.0
        clipsToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
       /* setTitleColor(tintColor, forState: .Normal)
        setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        setBackgroundImage(UIImage(color: tintColor), forState: .Highlighted)*/
    }
}
