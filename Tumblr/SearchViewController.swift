//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Sampo Karjalainen on 6/7/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var loadingImageView: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = feedView.image!.size
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        loadingImageView.image = animatedImage
    }
    
    override func viewWillAppear(animated: Bool) {
        scrollView.alpha = 0
        loadingImageView.alpha = 1
    }

    override func viewDidAppear(animated: Bool) {
        delay(2) {
            self.loadingImageView.alpha = 0
            UIView.animateWithDuration(0.3, animations: { 
                self.scrollView.alpha = 1
            })
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
