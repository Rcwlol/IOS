//
//  ViewController.swift
//  TextFieldDelegateApp
//
//  Created by ryan wong wong on 7/2/16.
//  Copyright © 2016 Ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockTextField: UITextField!
    
    @IBOutlet weak var lockSwitch: UISwitch!
    let zipCodeDelegate = ZipCodeDelegate()
    let cashDelegate = CashDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.zipCodeField.delegate = zipCodeDelegate
        self.cashTextField.delegate = cashDelegate
        self.lockTextField.delegate = self
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        return self.lockSwitch.on ? true :false
    
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

