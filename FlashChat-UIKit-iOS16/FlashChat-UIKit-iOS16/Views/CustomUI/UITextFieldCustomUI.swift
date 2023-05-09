//
//  UITextFieldCustomUI.swift
//  FlashChat-UIKit-iOS16
//
//  Created by Amr Mohamad on 09/05/2023.
//

import UIKit


extension UITextField {
    func roundedTextFieldWithShadow(){
     self.layer.cornerRadius = 30.0
     self.layer.shadowOffset = CGSize(width: 0.0, height: 16.0)
     self.layer.shadowOpacity = 0.15
     self.layer.shadowRadius = 10.0
    }
}
