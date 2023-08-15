//
//  Utilities.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 4/28/23.
//


import Foundation
import UIKit

// method adapted from https://www.youtube.com/watch?v=1HN7usMROt8
class Utilities {
    
    static func styleTextField(_ textfield:UITextField, _ vc: Int) {
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        if vc == 1 {
            bottomLine.backgroundColor = UIColor.init(red: 178/255, green: 102/255, blue: 255/255, alpha: 1).cgColor
        } else if vc == 2 {
            bottomLine.backgroundColor = UIColor.init(red: 51/255, green: 153/255, blue: 255/255, alpha: 1).cgColor
        } else if vc == 3 {
            bottomLine.backgroundColor = UIColor.init(red: 255/255, green: 153/255, blue: 51/255, alpha: 1).cgColor
        }
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton, _ vc: Int) {
        // Filled rounded corner style
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        if vc == 1 {
            button.backgroundColor = UIColor.init(red: 178/255, green: 102/255, blue: 255/255, alpha: 1)
        } else if vc == 2 {
            button.backgroundColor = UIColor.init(red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        } else if vc == 3 {
            button.backgroundColor = UIColor.init(red: 255/255, green: 153/255, blue: 51/255, alpha: 1)
        }
    }
    
    static func styleHollowButton(_ button:UIButton) {
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isEmailValid(_ email: String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailTest.evaluate(with: email)
    }
    
}
