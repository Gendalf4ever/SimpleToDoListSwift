//
//  Model.swift
//  ToDOList
//
//  Created by Master on 26.08.2021.
//  Copyright © 2021 Master. All rights reserved.
//

import Foundation
import UserNotifications

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
  
}
func changeState (at item: Int) -> Bool{
    ToDoItems[item]["isCompleted"] =  !(ToDoItems[item]["isCompleted"] as! Bool)

    return  ToDoItems[item]["isCompleted"] as! Bool
}
func removeItem(at index: Int) {
    ToDoItems.remove(at: index)

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
