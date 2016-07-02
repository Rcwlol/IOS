//
//  ResultViewController.swift
//  Roshambo
//
//  Created by ryan wong wong on 7/2/16.
//  Copyright © 2016 Ryan. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
  
    @IBOutlet weak var resultImage2: UIImageView!

    @IBOutlet weak var resultLabel2: UILabel!
    var won: Bool!
    var winCase: Int!
    
    
    override func viewWillAppear(animated: Bool) {
        
        if (self.won != false && self.won != nil ) {
            self.resultLabel2.text = "You Won!"
        } else if (self.won != true && self.won != nil){
            self.resultLabel2.text = "You Lost!"
        }else{
            self.resultLabel2.text = "You Tied!"
        }
        
        // The dice will only appear if firstValue and secondValue have been set
        if self.winCase==1{
            self.resultImage2.image = UIImage(named: "rockWins")
            self.resultLabel2.text = self.resultLabel2.text! + " Rock crushes scissor"
        } else if self.winCase==2{
            self.resultImage2.image = UIImage(named: "paperWins")
            self.resultLabel2.text = self.resultLabel2.text! + " Paper covers rock"
        }else if self.winCase==3{
            self.resultImage2.image = UIImage(named: "scissorWins")
            self.resultLabel2.text = self.resultLabel2.text! + " Scissor cuts paper"
        }else {
            self.resultImage2.image = UIImage(named: "tieGame")
        }
        
        self.resultImage2.alpha = 0
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) {
            self.resultImage2.alpha = 1
            
        }
    }
    
    /**
     * accepts a conditional Int, and returns an dice image, or nil
     */
    
    func imageForValue(value: Int?) -> UIImage? {
        return nil
    }
    
    /**
     *    dismiss this view controller
     */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
