//
//  LocalNotificationService.swift
//  20192507PNotificationPOC
//
//  Created by XPECTRA on 8/6/19.
//  Copyright © 2019 XPECTRA. All rights reserved.
//

import UserNotifications

public class LocalNotificationService {
    public static func makeNotifications(times: Int, timer: Int){
        var date = Date()
        
        for i in 0..<times{
            
            let content = UNMutableNotificationContent()
            content.title = "Evento automonitoreo \(i)"
            content.body = "Uno o más eventos necesitan atención"
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "events_sound.caf"))
            
            
            date = Calendar.current.date(byAdding: .second, value: timer, to: date)!
            
            let components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: date)
            
            // Create the trigger as a repeating event.
            let trigger = UNCalendarNotificationTrigger(
                dateMatching: components, repeats: false)
            
            // Create the request
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString,
                                                content: content, trigger: trigger)
            
            // Schedule the request with the system.
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request) { (error) in
                if error != nil {
                    // Handle any errors.
                }
            }
        }
    }
}
