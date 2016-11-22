//
//  ViewController.swift
//  WebViewActivityIndicator
//
//  Created by Marlon on 15/11/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    //MARK: - IBoutlets
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    var type: String?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if type! == url {
            let request = NSURLRequest(URL: NSURL(string:urlString)!)
            webView.loadRequest(request)
        }else if type! == html {
            webView.loadHTMLString(stringHTML, baseURL: nil)
        }else {
            if let path = NSBundle.mainBundle().pathForResource(pathPDF, ofType: pdf) {
                if let data = NSFileManager.defaultManager().contentsAtPath(path) {
                    webView.loadData(data, MIMEType: mimePDF, textEncodingName: "UTF-8", baseURL: NSURL())
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - UIWebViewDelegate
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(error?.localizedDescription)
        activityIndicator.stopAnimating()
        let alertController = UIAlertController(title: errorTitle, message: error?.localizedDescription, preferredStyle: .Alert)
        let oKAction = UIAlertAction(title: okTitle, style: .Destructive) { (action) in
            self.navigationController?.popViewControllerAnimated(true)
        }
        alertController.addAction(oKAction)
        presentViewController(alertController, animated: true, completion:nil)
    }
}

