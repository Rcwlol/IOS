//
//  ZipCodeDelegate.swift
//  TextFieldDelegateApp
//
//  Created by ryan wong wong on 7/4/16.
//  Copyright © 2016 Ryan. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeDelegate :NSObject, UITextFieldDelegate{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        //only allows you to change there are less than 5 numbers
        return newText.length <= 5
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}