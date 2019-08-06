//
//  NotificationService.swift
//  NotificationPOCNotificationServiceExtension
//
//  Created by XPECTRA on 8/6/19.
//  Copyright © 2019 XPECTRA. All rights reserved.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here...
            
            if let userInfo = bestAttemptContent.userInfo as? [String:Any],
                let times = userInfo["times"] as? Int,
                let timer = userInfo["timer"] as? Int {
                
                if(times > 0){
                    bestAttemptContent.title = "Notification recived at \(Date())"
                    bestAttemptContent.body = "Notification will start in \(timer)"
                    contentHandler(bestAttemptContent)

                }
                else{
                    bestAttemptContent.title = ""
                    bestAttemptContent.subtitle = ""
                }
                
                LocalNotificationService.makeNotifications(times: times, timer: timer)
            }
            else{
                bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
            }
            
        }
        
        
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
