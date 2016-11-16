//
//  WebViewOptionsViewController.swift
//  WebViewActivityIndicator
//
//  Created by Marlon on 16/11/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import UIKit

class WebViewOptionsViewController: UIViewController {
    
    //MARK: - IBActions
    
    @IBAction func loadURL(sender: AnyObject) {
        performSegueWithIdentifier(segueToWebview, sender: url)
    }
    
    
    @IBAction func loadStringHTML(sender: AnyObject) {
        performSegueWithIdentifier(segueToWebview, sender: html)
    }
    
    
    @IBAction func loadPDF(sender: AnyObject) {
        performSegueWithIdentifier(segueToWebview, sender: pdf)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let webViewVC = segue.destinationViewController as? ViewController {
            if let type = sender as? String {
                webViewVC.type = type
            }
            
        }
    }
 

}
