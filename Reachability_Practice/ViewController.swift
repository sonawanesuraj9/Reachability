//
//  ViewController.swift
//  Reachability_Practice
//
//  Created by Suraj MAC3 on 16/01/17.
//  Copyright © 2017 Suraj MAC3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblInternetStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.notifyInternetConnected(_:)), name: "internetConnected", object: nil)
         NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.notifyInternetNotAvailable(_:)), name: "internetNotAvailable", object: nil)
        
        if isConnected(){
             self.lblInternetStatus.text = "Connected to Internet"
        }else{
            self.lblInternetStatus.text = "Internet Not Available"
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        //self.lblInternetStatus.text = ""
    }
    /**
     Notification Handler method
     
     - parameter notification: Raised Notification passed here
     */
   func notifyInternetConnected(notification: NSNotification){
        //Take Action on Notification
    
        self.lblInternetStatus.text = "Connected to Internet"
        print("Welcome to the WORLD OF Internet..!!!!∫ßƒ©˙¥øπ¬µ∫˜ßåßΩ")
    
    }
    
    
    /**
     Notification Handler method
     
     - parameter notification: Raised Notification passed here
     */
    func notifyInternetNotAvailable(notification: NSNotification){
        //Take Action on Notification
          self.lblInternetStatus.text = "Internet Not Available"
        print("Not Available")
        
    }
    
    
    
    /**
     Function to check Internet is available or Not
     
     - returns: true if connected, else false
     */
    func isConnected()->Bool
    {
        let reachability = Reachability.reachabilityForInternetConnection
        let networkStatus = reachability().currentReachabilityStatus
        
        return !(networkStatus() == NotReachable)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

