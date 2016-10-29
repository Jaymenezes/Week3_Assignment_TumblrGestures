//
//  MailBoxViewController.swift
//  Week3_Assignment_TumblrGestures
//
//  Created by user on 10/26/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class MailBoxViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate{
    
    @IBOutlet weak var deleteImageView: UIImageView!
    @IBOutlet weak var archiveImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var laterImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    
    @IBOutlet weak var backgroundView: UIView!

    var messageOriginalX: CGFloat!
    var laterImageViewOriginalX: CGFloat!
    var archiveImageViewOriginalX: CGFloat!
    var feedScrollViewOriginalX: CGFloat!
    
        
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedScrollView.contentSize = CGSize(width: 375, height: 1500)
        feedScrollView.frame.size = CGSize(width: 375, height: 667)
        
        
        messageOriginalX = messageImageView.frame.origin.x
        laterImageViewOriginalX = laterImageView.frame.origin.x
        archiveImageViewOriginalX = archiveImageView.frame.origin.x
        feedScrollViewOriginalX = feedScrollView.frame.origin.x
        

        
        
        let edgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didPanFeedScrollView(sender:)))
        feedScrollView.isUserInteractionEnabled = true
        feedScrollView.addGestureRecognizer(edgePanGestureRecognizer)
        edgePanGestureRecognizer.delegate = self
        edgePanGestureRecognizer.edges = UIRectEdge.left

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didPanFeedScrollView (sender: UIScreenEdgePanGestureRecognizer) {
        
        let location = sender.location(in: view)
        

    }

@IBAction func panMessage(_ sender: UIPanGestureRecognizer) {
    let location = sender.location(in: view)
    let translation = sender.translation(in: view)
    print("l",location)
    print(translation)
    
    if sender.state == .began {
        
        
        
    } else if sender.state == .changed {
        
        
        laterImageView.alpha = 0.2
        archiveImageView.alpha = 0.2
        
        laterImageView.image = UIImage(named: "later_icon")
        archiveImageView.image = UIImage(named: "archive_icon")
        
        backgroundView.backgroundColor = UIColor.lightGray
        messageImageView.frame.origin.x = messageOriginalX + translation.x
        deleteImageView.alpha = 0


        // panning messageImageView to the right

        if messageImageView.frame.origin.x > 0 && messageImageView.frame.origin.x < 60 {
            archiveImageView.alpha = 0.2
            backgroundView.backgroundColor = UIColor.lightGray

            archiveImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 85)


            
        
        } else if messageImageView.frame.origin.x > 60 && messageImageView.frame.origin.x < 260 {
            
            self.backgroundView.backgroundColor = UIColor.green
            archiveImageView.alpha = 0.2
            archiveImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 85)

            self.archiveImageView.alpha = 1


            
        } else if messageImageView.frame.origin.x > 260{
            self.backgroundView.backgroundColor = UIColor.red
            self.deleteImageView.alpha = 1
            deleteImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 85)

            self.archiveImageView.alpha = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                
            })

            
            
            
        } else if messageImageView.frame.origin.x < 0 && messageImageView.frame.origin.x > -375 {
            
            
            
        
        } else if messageImageView.frame.origin.x > 0 && messageImageView.frame.origin.x < 260 {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.backgroundView.backgroundColor = UIColor.green
            })
        } else if messageImageView.frame.origin.x > 0 && messageImageView.frame.origin.x < 375 {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.backgroundView.backgroundColor = UIColor.red
            })
            
        }
    } else if sender.state == .ended {
        messageImageView.frame.origin.x = messageOriginalX + translation.x


        
        
    }
    
    //                                        archiveImageView.image = UIImage(named: "archive_icon")
    //                                        archiveImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 60)
    
    
    //            } else messageImageView.frame.origin.x > 0 && messageImageView.frame.origin.x < 375 {
    //
    //                UIView.animate(withDuration: 0.3, animations: {
    //
    //                    }//
    
    
}


//            if location.y > 395 {
//                UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: [], animations: {
//
//                    let imageView = sender.view as! UIImageView
//
//                    self.newlyCreatedFace.center = imageView.center
//                    self.newlyCreatedFace.center.y += self.trayView.frame.origin.y
//                    self.newlyCreatedFace.center.x += self.trayView.frame.origin.x
//                    self.newlyCreatedFace.transform = self.newlyCreatedFace.transform.scaledBy(x: 0.8, y: 0.8)
//                }) { (Bool) in
//                    self.newlyCreatedFace.removeFromSuperview()
//
//                }



}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


