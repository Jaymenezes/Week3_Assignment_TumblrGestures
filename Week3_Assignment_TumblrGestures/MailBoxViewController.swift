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
    @IBOutlet weak var messageParentView: UIView!
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    
    var messageOriginalX: CGFloat!
    var laterImageViewOriginalX: CGFloat!
    var listImageViewOriginalX: CGFloat!
    var messageParentOriginalY: CGFloat!
    var archiveImageViewOriginalX: CGFloat!
    var feedScrollViewOriginalX: CGFloat!
    
    var feedImageOriginalY: CGFloat!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedScrollView.contentSize = CGSize(width: 375, height: 1500)
        feedScrollView.frame.size = CGSize(width: 375, height: 667)
        
        
        
        
        messageOriginalX = messageImageView.frame.origin.x
        laterImageViewOriginalX = laterImageView.frame.origin.x
        listImageViewOriginalX = listImageView.frame.origin.x
        
        archiveImageViewOriginalX = archiveImageView.frame.origin.x
        feedScrollViewOriginalX = feedScrollView.frame.origin.x
        feedImageOriginalY = feedImageView.frame.origin.y
        messageParentOriginalY = messageParentView.frame.origin.y
        
        
        
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
    
    @IBAction func didPressRestoreDoubleTap(_ sender: UITapGestureRecognizer) {
        messageParentView.alpha = 0
        backgroundView.alpha = 1
        archiveImageView.alpha = 1

        
        UIView.animate(withDuration: 0.2, animations: {
            self.feedImageView.frame.origin.y = self.feedImageOriginalY
            
        }) { (Bool) in
            UIView.animate(withDuration: 0, animations: {
                self.messageImageView.frame.origin.x = self.messageOriginalX

            })
            UIView.animate(withDuration: 0.1, animations: {
                self.messageParentView.alpha = 1


                
            })
        }
        print("restorebeingCalled")
        
    }
    
    func didPanFeedScrollView (sender: UIScreenEdgePanGestureRecognizer) {
        
        let location = sender.location(in: view)

    }
    
    
    
    @IBAction func panMessage(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let translation = sender.translation(in: view)
        print(translation)
        
        
        
        if sender.state == .began {
            
            
            
        } else if sender.state == .changed {
            
            
            laterImageView.alpha = 0.2
            archiveImageView.alpha = 0.2
            deleteImageView.alpha = 0
            listImageView.alpha = 0
            
            laterImageView.image = UIImage(named: "later_icon")
            archiveImageView.image = UIImage(named: "archive_icon")
            listImageView.image = UIImage(named: "list_icon")
            deleteImageView.image = UIImage(named: "delete_icon")
            
            backgroundView.backgroundColor = UIColor.lightGray
            messageImageView.frame.origin.x = messageOriginalX + translation.x
            
            
            
            
            
            // panning messageImageView to the right
            
            if messageImageView.frame.origin.x > 0 && messageImageView.frame.origin.x < 60 {
                archiveImageView.alpha = 0.2
                backgroundView.backgroundColor = UIColor.lightGray
                
                
                archiveImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 75)
                
                
                
                
            } else if messageImageView.frame.origin.x > 60 && messageImageView.frame.origin.x < 260 {
                
                self.backgroundView.backgroundColor = UIColor.green
                
                archiveImageView.alpha = 0.2
                archiveImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 75)
                
                self.archiveImageView.alpha = 1
                
                
                
            } else if messageImageView.frame.origin.x > 260{
                self.backgroundView.backgroundColor = UIColor.red
                self.deleteImageView.alpha = 1
                deleteImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 75)
                
                self.archiveImageView.alpha = 0
                
                
                //panning messageImageView to the left
                
            } else if messageImageView.frame.origin.x < 0 && messageImageView.frame.origin.x > -60 {
                laterImageView.alpha = 0.2
                backgroundView.backgroundColor = UIColor.lightGray
                
                
                self.laterImageView.frame.origin.x = laterImageViewOriginalX + (translation.x + 75)
                
                
                
                
            } else if messageImageView.frame.origin.x < -60 && messageImageView.frame.origin.x > -260 {
                laterImageView.alpha = 1
                backgroundView.backgroundColor = UIColor.yellow
                
                
                self.laterImageView.frame.origin.x = laterImageViewOriginalX + (translation.x + 75)
                
                
            } else if messageImageView.frame.origin.x < -260 {
                archiveImageView.alpha = 0
                self.backgroundView.backgroundColor = UIColor.brown
                listImageView.alpha = 1
                self.listImageView.frame.origin.x = listImageViewOriginalX + (translation.x + 75)
                
                self.laterImageView.alpha = 0
                
            }
            
            
        } else if sender.state == .ended {
            
            //Conditional to finish movement when pan messageViewRight initiated
            
        
            if messageImageView.frame.origin.x > 0 && messageImageView.frame.origin.x < 60 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.messageImageView.frame.origin.x = self.messageOriginalX
                    self.archiveImageView.alpha = 0
                    
                })
                
                
            } else if messageImageView.frame.origin.x > 60 && messageImageView.frame.origin.x < 260 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.messageImageView.frame.origin.x = self.messageOriginalX + (translation.x + 300)
                    self.archiveImageView.alpha = 0
                    
                }) { (Bool) in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.backgroundView.alpha = 0
                        
                    })
                    UIView.animate(withDuration: 0.5, animations: {
                        self.feedImageView.frame.origin.y = self.feedImageOriginalY + (translation.y - 100)
                        
                    })
                    
                }
                
            } else if messageImageView.frame.origin.x > 260{
                self.archiveImageView.alpha = 0

                UIView.animate(withDuration: 0.3, animations: {
                    self.messageImageView.frame.origin.x = self.messageOriginalX + (translation.x + 300)
                    self.deleteImageView.alpha = 0
                    

                    
                }) { (Bool) in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.backgroundView.alpha = 0
                        
                    })
                    UIView.animate(withDuration: 0.3, animations: {
                        self.feedImageView.frame.origin.y = self.feedImageOriginalY + (translation.y - 100)
                        
                    })
                }
                
                //Conditional to finish movement when pan messageViewLeft initiated

                
                
            } else if messageImageView.frame.origin.x < 0 && messageImageView.frame.origin.x > -60 {
                laterImageView.alpha = 0.2
                backgroundView.backgroundColor = UIColor.lightGray
                UIView.animate(withDuration: 0.2, animations: {
                    self.messageImageView.frame.origin.x = self.messageOriginalX
                    self.archiveImageView.alpha = 0
                    
                })
                
                
                
                
                
                
            } else if messageImageView.frame.origin.x < -60 && messageImageView.frame.origin.x > -260 {
                backgroundView.backgroundColor = UIColor.yellow

                UIView.animate(withDuration: 0.4, animations: {

                    self.messageImageView.frame.origin.x = self.messageOriginalX + (translation.x - 300)
                    self.laterImageView.alpha = 0
                    
                    
                }) { (Bool) in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.backgroundView.alpha = 0
                        
                    })
                    UIView.animate(withDuration: 0.5, animations: {
                        self.feedImageView.frame.origin.y = self.feedImageOriginalY + (translation.y - 100)
                        
                    })
                    
                }

                
            } else if messageImageView.frame.origin.x < -260 {
                
                archiveImageView.alpha = 0
                self.backgroundView.backgroundColor = UIColor.brown
                self.listImageView.alpha = 1
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageImageView.frame.origin.x = self.messageOriginalX + (translation.x - 300)
                    self.listImageView.alpha = 0

                    
                }) { (Bool) in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.backgroundView.alpha = 0
                    })
                    UIView.animate(withDuration: 0.5, animations: {
                        self.feedImageView.frame.origin.y = self.feedImageOriginalY + (translation.y - 100)
                        
                        
                    })
                }

                
            }
            
            
            
            
            
        }
        
        
        
        
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


