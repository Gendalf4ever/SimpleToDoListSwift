//
//  Model.swift
//  ToDOList
//
//  Created by Master on 26.08.2021.
//  Copyright © 2021 Master. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit
var ToDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    
    get{
        if let someArray = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
           return someArray
        } else {
            return []
        }
    }
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from, at: toIndex)

}

func addItem(itemName:String, isCompleted: Bool = false){
    ToDoItems.append(["Name": itemName, "isCompleted": false])
    setBadge()
}
func changeState (at item: Int) -> Bool{
    ToDoItems[item]["isCompleted"] =  !(ToDoItems[item]["isCompleted"] as! Bool)
    setBadge()
    return  ToDoItems[item]["isCompleted"] as! Bool
}
func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
    setBadge()
}

func requestForNotification(){
    UNUserNotificationCenter.current().requestAuthorization(options: [.badge]) { (isEnabled, error) in
        if isEnabled {
            print("Согласие")
        } else {
            print("Несогласие")
        }
    }
}

func setBadge(){
    var badgeNumber = 0
    for item in ToDoItems {
        if (item["isCompleted"] as? Bool) == false {
            badgeNumber = badgeNumber + 1
        }
    }
    UIApplication.shared.applicationIconBadgeNumber = badgeNumber
}
