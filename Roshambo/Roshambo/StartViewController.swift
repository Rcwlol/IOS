//
//  ViewController.swift
//  Roshambo
//
//  Created by ryan wong wong on 7/2/16.
//  Copyright © 2016 Ryan. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    var myMove:String!
    var opMove:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func opponentMove() ->String{
        let randomValue = 1 + arc4random() % 3
        if randomValue == 1{
            return("rock")
        } else if randomValue == 2{
            return("paper")
        } else if randomValue == 3{
            return("scissor")
        }else{
            return("error")
        }
    }
    func match(controller:ResultViewController){
        opMove = opponentMove()
        if myMove == opMove{
            controller.won = nil
            controller.winCase = 0
        }else if myMove == "rock"{
            if opMove == "paper"{
                controller.won = false
                controller.winCase = 2
            }else if opMove == "scissor"{
                controller.won = true
                controller.winCase = 1
            }else{
                print("error")
            }
            
        }else if myMove == "paper"{
            if opMove == "scissor"{
                controller.won = false
                controller.winCase = 3
            }else if opMove == "rock"{
                controller.won = true
                controller.winCase = 2
            }else{
                print("error")
            }
            
        }else if myMove == "scissor"{
            if opMove == "rock"{
                controller.won = false
                controller.winCase = 1
            }else if opMove == "paper"{
                controller.won = true
                controller.winCase = 3
            }else{
                print("error")
            }
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "paperChoice"{
            let controller = segue.destinationViewController as! ResultViewController
            myMove = "paper"
            match(controller)
            
        }else if segue.identifier == "scissorChoice"{
            let controller = segue.destinationViewController as! ResultViewController
            myMove = "scissor"
            match(controller)
        }
        
    }
    /*
     @IBAction func run(){
     
     self.performSegueWithIdentifier("scissorChoice", sender: self)
     }
     */
    
    
    @IBAction func paperRun(){
        self.performSegueWithIdentifier("paperChoice", sender: self)
        
    }
    @IBAction func codeSegue(){
        print("here i am")
        //get the Result View Controller
        var controller: ResultViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        //play the game
        myMove = "rock"
        match(controller)
        
        //Present the view controller
        presentViewController(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
