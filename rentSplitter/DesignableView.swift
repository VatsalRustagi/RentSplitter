//
//  DesignableView.swift
//  rentSplitter
//
//  Created by Vatsal Rustagi on 8/8/17.
//  Copyright © 2017 Vatsal Rustagi. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableButton: UIButton{
    
}

@IBDesignable
class rentTextField: UITextField{
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.minX + 10 , y: bounds.minY, width: bounds.width-10, height: bounds.height)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.minX + 10 , y: bounds.minY, width: bounds.width-10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.minX + 10 , y: bounds.minY, width: bounds.width-10, height: bounds.height)
    }
}


var materialKey = false

extension UIView{
    @IBInspectable
    var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    
    
    @IBInspectable
    var material: Bool{
        get{
            return materialKey
        }
        set{
            if newValue == true{
                materialKey = true
                
                layer.shadowColor = UIColor.green.cgColor
                layer.shadowOffset = CGSize(width: 0, height: 1)
                layer.shadowRadius = 1.0
                layer.shadowOpacity = 1.0
                
            }
            else{
                materialKey = false
                
                layer.shadowRadius = 0.0
                layer.shadowOpacity = 0.0
                
            }
        }
    }
    
}
