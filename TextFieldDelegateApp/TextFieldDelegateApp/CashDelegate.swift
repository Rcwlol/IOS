//
//  CashDelegate.swift
//  TextFieldDelegateApp
//
//  Created by ryan wong wong on 7/4/16.
//  Copyright © 2016 Ryan. All rights reserved.
//
//  Needed to look at the solution for this delegeate.
//  Tried my best to understand the code provided to finish app

import Foundation
import UIKit

class CashDelegate : NSObject, UITextFieldDelegate{

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let numbers = NSCharacterSet.decimalDigitCharacterSet()
        var newText = textField.text! as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        let oldText = textField.text! as NSString
        newText = oldText.stringByReplacingCharactersInRange(range, withString: string)
        var newTextString = String(newText)
        var numText = ""
        
        for a in newTextString.unicodeScalars {
            if numbers.longCharacterIsMember(a.value) {
                numText.append(a)
            }
        }
    
    
        // Formats the string into $0.00 form
        if let fullValue = Int(numText) {
            print("full value")
            newText = "$" + self.dollarStringFromInt(fullValue) + "." + self.centsStringFromInt(fullValue)

            if let numOfPennies = Int(numText) {
                print("pennies")
                newText = "$" + self.dollarStringFromInt(numOfPennies) + "." + self.centsStringFromInt(numOfPennies)
            } else {
                newText = "$0.00"
            }
        }
        //set the textfield to the new string
        textField.text = newText as String
            
        return false
    }
        //sets the  thield to $0.00 form if empty
        func textFieldDidBeginEditing(textField: UITextField) {
            if textField.text!.isEmpty {
                    textField.text = "$0.00"
                }
            }
    
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
                
            return true;
        }
        //gets the dollar amount by dividing by 100 essentially skipping the last 2 decimal places and returns as string
        func dollarStringFromInt(value: Int) -> String {
            return String(value / 100)
        }
        //gets the last 2 numbers of the the value and returns as string
        func centsStringFromInt(value: Int) -> String {
                
            let cents = value % 100
            var centsString = String(cents)
             //if the cents is less than 10 we pad it with 0
            if cents < 10 {
                centsString = "0" + centsString
            }
                
            return centsString
        }
}