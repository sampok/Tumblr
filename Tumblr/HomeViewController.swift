//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Sampo Karjalainen on 6/7/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var spinnerImageView: UIImageView!
    
    var fadeTransition: FadeTransition!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(20, delay: 0, options: [.Repeat, .CurveLinear], animations: {
            print("Animating \"home rays\"")
            self.spinnerImageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        }) { (Bool) in
            // nothing
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        spinnerImageView.layer.removeAllAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.2
    }
 

}
