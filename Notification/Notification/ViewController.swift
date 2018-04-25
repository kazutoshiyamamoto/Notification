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

    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setNotification(_ sender: Any) {
        
        let seconds = Int(segment.titleForSegment(at: segment.selectedSegmentIndex)!)!
        
        // content
        let content = UNMutableNotificationContent()
        content.title = "It's Time."
        content.subtitle   = "\(seconds) seconds elapsed!"
        content.body = "I told you new because you had set \(seconds) seconds before."
        content.sound = UNNotificationSound.default()
        
        // triger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(seconds), repeats: false)
        
        // request includes content & trigger
        let request = UNNotificationRequest(identifier: "Timer\(seconds)", content: content, trigger: trigger)
        
        // schedule notification by adding request to notification center
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    // ToDo:フォアグラウンドの場合には通知は表示

}

