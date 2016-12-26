//
//  insetTextFild.swift
//  KharkivChat
//
//  Created by Ievgen Naloiko on 12/23/16.
//  Copyright © 2016 Naloiko. All rights reserved.
//

import UIKit

@IBDesignable
class InsetTextField: UITextField {
    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0
    
    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
    }
    
    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
    }
}
