//
//  ViewController.swift
//  Meme-me-1.0
//
//  Created by Wong, Ryan C on 7/7/16.
//  Copyright © 2016 Wong, Ryan C. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate{
    struct Meme {
        var topText: String!
        var image: UIImage!
        var botText: String!
        var memedImage: UIImage!
        

    }
    var memes: [Meme]!
    @IBOutlet weak var camButton: UIBarButtonItem!
    @IBOutlet weak var imagePicked: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var botTextField: UITextField!
    var currentTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTextField.delegate = self
        botTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : 3.0
            
        ]
        topTextField.defaultTextAttributes = memeTextAttributes
        botTextField.defaultTextAttributes = memeTextAttributes
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.subscribeToKeyboardNotifications()
        camButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        if imagePicked.image != nil{
            shareButton.enabled = true
        }else{
            shareButton.enabled = false
        }
        
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
       
        self.unsubscribeFromKeyboardNotifications()
        
    }

    @IBAction func pickAnImageAlbum(sender: AnyObject) {
       
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(pickerController, animated: true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePicked.image = image
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    @IBAction func pickImageCam(sender: AnyObject) {
        
        let pickController = UIImagePickerController()
        pickController.delegate = self
        pickController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(pickController, animated: true, completion: nil)
    }
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name:
            UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object:nil)
       
    }
    func keyboardWillShow(notification: NSNotification) {
        if self.currentTextField == botTextField{
        self.view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    func keyBoardWillHide(notification: NSNotification){
        if self.currentTextField == botTextField{
        self.view.frame.origin.y += getKeyboardHeight(notification)
        }
    
    }
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo!
        let keyboardSize = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        self.currentTextField = textField
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func save() {
        //Create the meme
        var meme = Meme( topText: topTextField.text!, image:
            imagePicked.image, botText: botTextField.text!, memedImage: self.generateMemedImage())
        
    }
    func generateMemedImage() -> UIImage{
    // Render view to an image
        toolBar.hidden = true
        shareButton.hidden = true
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        toolBar.hidden = false
        shareButton.hidden = false
    
    
    return memedImage
    }
    @IBAction func youGetMeme(sender: AnyObject) {
        let mememe = generateMemedImage()
        let share = UIActivityViewController(activityItems: [mememe], applicationActivities: nil)
        self.presentViewController(share, animated : true, completion: nil)
        
        share.completionWithItemsHandler = {(activityType, completed:Bool, returnedItems:[AnyObject]?, error: NSError?) in
            
            if (completed) {
                self.save()
                self.dismissViewControllerAnimated(true, completion: nil)
            }else{
                return
            }
            
            
        }
    }


}


