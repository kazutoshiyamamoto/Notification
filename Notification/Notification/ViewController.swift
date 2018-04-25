//
//  ViewController.swift
//  Notification
//
//  Created by home on 2018/04/25.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let content = UNMutableNotificationContent()
    content.title = NSString.localizedUserNotification(forKey: "Wake up!", arguments: nil)
    content.body = NSString.localizedUserNotification(forKey: "It's morning time!", arguments: nil)
    
    


}

