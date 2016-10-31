//
//  MailBoxViewController.swift
//  Week3_Assignment_TumblrGestures
//
//  Created by user on 10/26/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class MailBoxViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate{
    
    
    @IBOutlet var tapDismissLaterPage: UITapGestureRecognizer!
    @IBOutlet weak var deleteImageView: UIImageView!
    @IBOutlet weak var archiveImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var laterImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var messageParentView: UIView!
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var masterParentView: UIView!
    @IBOutlet weak var menuImageView: UIImageView!
    
    @IBOutlet weak var navBarSegmentedControl: UISegmentedControl!
    @IBOutlet weak var fullScreenListImageView: UIImageView!
   
    @IBOutlet weak var reescheduleFullImageView: UIImageView!
    
    var messageOriginalX: CGFloat!
    var laterImageViewOriginalX: CGFloat!
    var listImageViewOriginalX: CGFloat!
    var messageParentOriginalY: CGFloat!
    var archiveImageViewOriginalX: CGFloat!
    var feedScrollViewOriginalX: CGFloat!
    var masterParentViewOriginalX: CGFloat!
    var feedImageOriginalY: CGFloat!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedScrollView.contentSize = CGSize(width: 365, height: 1500)
        feedScrollView.frame.size = CGSize(width: 365, height: 667)
        
        
      




        
        
        
        
        
        messageOriginalX = messageImageView.frame.origin.x
        laterImageViewOriginalX = laterImageView.frame.origin.x
        listImageViewOriginalX = listImageView.frame.origin.x
        
        archiveImageViewOriginalX = archiveImageView.frame.origin.x
        feedScrollViewOriginalX = feedScrollView.frame.origin.x
        feedImageOriginalY = feedImageView.frame.origin.y
        messageParentOriginalY = messageParentView.frame.origin.y
         masterParentViewOriginalX = masterParentView.frame.origin.x
        
        
        
        
        let edgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didScreenEdgePan(sender:)))
        masterParentView.isUserInteractionEnabled = true
        masterParentView.addGestureRecognizer(edgePanGestureRecognizer)
        edgePanGestureRecognizer.delegate = self
        edgePanGestureRecognizer.edges = UIRectEdge.left
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
    
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

        

        print("shake works")
        
        
    }
    
    @IBAction func toggleNavSegmentedControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            reescheduleFullImageView.alpha = 1
            
            
        } else if sender.selectedSegmentIndex == 1 {
            reescheduleFullImageView.alpha = 0
            
        } else if sender.selectedSegmentIndex == 2 {
            
        }
        
    }

    
//    overide func canBecomeFirstResponder() -> Bool {
//        return true
//        
//    }
//    

    
    
    @IBAction func menuRestoreButton(_ sender: Any) {
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
        self.masterParentView.frame.origin.x = self.masterParentViewOriginalX
        })
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

    
    // pan masterParentView
    func didScreenEdgePan(sender: UIScreenEdgePanGestureRecognizer) {
        menuImageView.alpha = 1
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        print("velocity", velocity)

        if sender.state == .began {

        } else if sender.state == .changed {
            self.masterParentView.frame.origin.x = self.masterParentViewOriginalX + translation.x

        
        } else if sender.state == .ended {
            if velocity.x > 0 {
//                self.masterParentView.frame.origin.x = self.masterParentViewOriginalX + (translation.x + 350)

                
                UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
                    self.masterParentView.frame.origin.x = self.masterParentViewOriginalX + 335

                    
                }, completion: { (Bool) in
                    
                })
                
            } else if velocity.x < 0{
                UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
                    self.masterParentView.frame.origin.x = self.masterParentViewOriginalX
                    
                }, completion: { (Bool) in
                    
                })
            }


        }
    }
    
 
    
    @IBAction func didPressDismissLaterPage(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7){
        self.navBarSegmentedControl.selectedSegmentIndex = 1
        }

        reescheduleFullImageView.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.messageImageView.frame.origin.x = self.messageOriginalX + 300
            self.archiveImageView.alpha = 0
            
        }) { (Bool) in
            UIView.animate(withDuration: 0.1, animations: {
                self.messageImageView.alpha = 1
                
            }) {(Bool) in
            UIView.animate(withDuration: 0.5, animations: {
                self.feedImageView.frame.origin.y = self.feedImageOriginalY - 100
                
            })
            }
            
        }

    }

    

    
    @IBAction func didTapDismissList(_ sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.fullScreenListImageView.alpha = 0
            
        }) { (Bool) in
            self.messageParentView.alpha = 0
            self.backgroundView.alpha = 1
            self.archiveImageView.alpha = 1
            
            
            UIView.animate(withDuration: 0.2, animations: {
                self.messageImageView.frame.origin.x = self.messageOriginalX + 300
                
            }) { (Bool) in
                UIView.animate(withDuration: 0, animations: {
                    self.messageParentView.alpha = 0

                    
                })
                UIView.animate(withDuration: 0.5, animations: {
                    self.feedImageView.frame.origin.y = self.feedImageOriginalY - 100

                })
            }
            
        }
        
        
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
                let opacity = convertValue(inputValue: CGFloat(translation.x), r1Min: 0, r1Max: 60, r2Min: 0, r2Max: 1)
                archiveImageView.alpha = opacity
                
                backgroundView.backgroundColor = UIColor.lightGray
                
                
                archiveImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 65)
                
                
                
                
            } else if messageImageView.frame.origin.x > 60 && messageImageView.frame.origin.x < 260 {
                let myGreen = UIColor(red: 112/255, green: 216/255, blue: 98/255, alpha: 1.0)

                
                self.backgroundView.backgroundColor = myGreen
                
                
                
                archiveImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 65)
                
                self.archiveImageView.alpha = 1
                
                
                
            } else if messageImageView.frame.origin.x > 260{
                let myRed = UIColor(red: 235, green: 84, blue: 51)

                self.backgroundView.backgroundColor = myRed
                self.deleteImageView.alpha = 1
                deleteImageView.frame.origin.x = archiveImageViewOriginalX + (translation.x - 65)
                
                self.archiveImageView.alpha = 0
                
                
                //panning messageImageView to the left
                
            } else if messageImageView.frame.origin.x < 0 && messageImageView.frame.origin.x > -60 {
                let opacity = convertValue(inputValue: CGFloat(translation.x), r1Min: 0, r1Max: -60, r2Min: 0, r2Max: 1)
                laterImageView.alpha = opacity
                
                backgroundView.backgroundColor = UIColor.lightGray
                self.laterImageView.frame.origin.x = laterImageViewOriginalX + (translation.x + 65)
                
            } else if messageImageView.frame.origin.x < -60 && messageImageView.frame.origin.x > -260 {
                laterImageView.alpha = 1
                let myYellow = UIColor(red: 250, green: 211, blue: 51)

                backgroundView.backgroundColor = myYellow
                
                
                self.laterImageView.frame.origin.x = laterImageViewOriginalX + (translation.x + 65)
                
                
            } else if messageImageView.frame.origin.x < -260 {
                archiveImageView.alpha = 0
                
                // custom colors
                let myBrown = UIColor(red: 216, green: 166, blue: 117)
                self.backgroundView.backgroundColor = myBrown
                listImageView.alpha = 1
                self.listImageView.frame.origin.x = listImageViewOriginalX + (translation.x + 65)
                
                self.laterImageView.alpha = 0
                
            }
            
            
        } else if sender.state == .ended {
            
            //Conditional to finish movement when pan messageViewRight initiated
            
        
            if messageImageView.frame.origin.x > 0 && messageImageView.frame.origin.x < 60 {
                let opacity = convertValue(inputValue: CGFloat(translation.x), r1Min: 0, r1Max: -60, r2Min: 0, r2Max: 1)
                archiveImageView.alpha = opacity
               
                laterImageView.alpha = 0
                listImageView.alpha = 0
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageImageView.frame.origin.x = self.messageOriginalX + translation.x
                    
                })
                
                
            } else if messageImageView.frame.origin.x > 60 && messageImageView.frame.origin.x < 260 {
                laterImageView.alpha = 0
                listImageView.alpha = 0
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
                listImageView.alpha = 0

                

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
                archiveImageView.alpha = 0
                deleteImageView.alpha = 0
                
                let opacity = convertValue(inputValue: CGFloat(translation.x), r1Min: 0, r1Max: -60, r2Min: 0, r2Max: 1)
                laterImageView.alpha = opacity

                
                
                backgroundView.backgroundColor = UIColor.lightGray
                UIView.animate(withDuration: 0.2, animations: {

                    self.messageImageView.frame.origin.x = self.messageOriginalX
                    
                })

            } else if messageImageView.frame.origin.x < -60 && messageImageView.frame.origin.x > -260 {
                
                archiveImageView.alpha = 0
                deleteImageView.alpha = 0
                
                self.backgroundView.backgroundColor = UIColor.yellow
                self.laterImageView.alpha = 1
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageImageView.frame.origin.x = self.messageOriginalX + (translation.x - 300)
                    self.laterImageView.alpha = 0
                    self.reescheduleFullImageView.alpha = 1


                    
                }) { (Bool) in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.backgroundView.alpha = 0
                    })
                    UIView.animate(withDuration: 0.5, animations: {
                        self.feedImageView.frame.origin.y = self.feedImageOriginalY
                        
                    })
                }


            } else if messageImageView.frame.origin.x < -260 {
                
                archiveImageView.alpha = 0
                deleteImageView.alpha = 0
                let myBrown = UIColor(red: 216, green: 166, blue: 217)

                self.backgroundView.backgroundColor = myBrown
                self.listImageView.alpha = 1
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageImageView.frame.origin.x = self.messageOriginalX + (translation.x - 300)
                    self.listImageView.alpha = 0
                    self.fullScreenListImageView.alpha = 1


                }) { (Bool) in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.backgroundView.alpha = 0
                    })
                    UIView.animate(withDuration: 0.5, animations: {
                        self.feedImageView.frame.origin.y = self.feedImageOriginalY
                        
                    })
                }

                
            }

            
        }

    }
    

    
    
    
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


