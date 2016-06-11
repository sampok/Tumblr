//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Sampo Karjalainen on 6/7/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet var composeButtons: [UIButton]!
    
    var composeButtonsY: [CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for composeButton in composeButtons {
            composeButtonsY.append(composeButton.frame.origin.y)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        for composeButton in composeButtons {
            composeButton.frame.origin.y = view.frame.size.height + CGFloat(arc4random_uniform(800))
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            for (index, composeButton) in self.composeButtons.enumerate() {
                composeButton.frame.origin.y = self.composeButtonsY[index]
            }
        }) { (Bool) in
            // nothing
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNevermind(sender: AnyObject) {
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0, options: .CurveEaseIn, animations: {
            for composeButton in self.composeButtons {
                composeButton.frame.origin.y = -(150 + CGFloat(arc4random_uniform(500)))
            }
            }) { (Bool) in
                self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
