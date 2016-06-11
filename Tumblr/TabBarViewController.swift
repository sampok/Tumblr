//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Sampo Karjalainen on 6/7/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var calloutImageView: UIImageView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    var calloutInitialY: CGFloat!
    
    var fadeTransition: FadeTransition!
    var callOutTransform: CATransform3D!
    var callOutShown: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        
        calloutInitialY = calloutImageView.center.y
        UIView.animateWithDuration(1, delay: 0, options: [.Autoreverse, .Repeat], animations: {
            self.calloutImageView.center.y = self.calloutInitialY - 10
        }) { (Bool) in
            // nothing
        }
        
        callOutTransform = CATransform3DIdentity
        callOutTransform.m34 = 1.0 / 500.0
        callOutTransform = CATransform3DRotate(callOutTransform, 0, 1, 0, 0)
        calloutImageView.layer.zPosition = 100
        setAnchorPoint(CGPoint(x: 0.5, y: 0.8), forView: calloutImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        if selectedIndex == 1 {
            animateCalloutOut()
        } else {
            animateCalloutIn()
        }

        buttons[previousIndex].selected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
    }
    
    func animateCalloutIn() {
        if callOutShown == false {
            callOutShown = true
            UIView.animateWithDuration(0.2, animations: {
                self.callOutTransform = CATransform3DRotate(self.callOutTransform, CGFloat(90 * M_PI / 180), 1, 0, 0)
                self.calloutImageView.layer.transform = self.callOutTransform
                self.calloutImageView.alpha = 1
            })
        }
    }
    
    func animateCalloutOut() {
        if callOutShown == true {
            callOutShown = false
            UIView.animateWithDuration(0.2, animations: {
                self.callOutTransform = CATransform3DRotate(self.callOutTransform, CGFloat(-90 * M_PI / 180), 1, 0, 0)
                self.calloutImageView.layer.transform = self.callOutTransform
                self.calloutImageView.alpha = 0.5
            })
        }
    }
    
    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
        var newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y)
        
        newPoint = CGPointApplyAffineTransform(newPoint, view.transform)
        oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform)
        
        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
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
