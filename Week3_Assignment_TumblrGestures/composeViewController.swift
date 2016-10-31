//
//  composeViewController.swift
//  Week3_Assignment_TumblrGestures
//
//  Created by user on 10/31/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class composeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressDismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: {})

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
