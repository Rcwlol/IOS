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
    
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    var won: Bool!
    var winCase: Int!
    
    
    override func viewWillAppear(animated: Bool) {
        
        if (self.won != false && self.won != nil ) {
            self.resultLabel.text = "You Won!"
        } else if (self.won != true && self.won != nil){
            self.resultLabel.text = "You Lost!"
        }else{
            self.resultLabel.text = "You Tied!"
        }
        
        // The dice will only appear if firstValue and secondValue have been set
        if self.winCase==1{
            self.resultImage.image = UIImage(named: "rockWins")
            self.resultLabel.text = self.resultLabel.text! + " Rock crushes scissor"
        } else if self.winCase==2{
            self.resultImage.image = UIImage(named: "paperWins")
            self.resultLabel.text = self.resultLabel.text! + " Paper covers rock"
        }else if self.winCase==3{
            self.resultImage.image = UIImage(named: "scissorWins")
            self.resultLabel.text = self.resultLabel.text! + " Scissor cuts paper"
        }else {
            self.resultImage.image = UIImage(named: "tieGame")
        }
        
        self.resultImage.alpha = 0
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) {
            self.resultImage.alpha = 1
            
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
