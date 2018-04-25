//
//  ViewController.swift
//  Notification
//
//  Created by home on 2018/04/25.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBAction func setNotification(_ sender: Any) {
        // タイトル、本文、サウンド設定の保持
        let content = UNMutableNotificationContent()
        content.title = "時間です"
        content.subtitle   = "5秒経過しました"
        content.body = "タップしてアプリを開いてください"
        content.sound = UNNotificationSound.default()
        
        // seconds後に起動するトリガーを保持
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // 識別子とともに通知の表示内容とトリガーを内包する
        let request = UNNotificationRequest(identifier: "TIMER", content: content, trigger: trigger)
        
        // UNUserNotificationCenterにrequestを加える
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // フォアグラウンドの場合にも通知を表示
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}

