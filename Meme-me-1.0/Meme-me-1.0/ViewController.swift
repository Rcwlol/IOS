//
//  ViewController.swift
//  Meme-me-1.0
//
//  Created by Wong, Ryan C on 7/7/16.
//  Copyright © 2016 Wong, Ryan C. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagePicked: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pickAnImage(sender: AnyObject) {
        let pickerController = UIImagePickerController()
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

