//
//  Model.swift
//  ToDOList
//
//  Created by Master on 26.08.2021.
//  Copyright © 2021 Master. All rights reserved.
//

import Foundation


var ToDoItems: [[String: Any]] = [["Name" : "bebe", "isCompleted": false], ["Name" : "baba", "isCompleted": false], ["Name" : "bubu", "isCompleted": false]]
func addItem(itemName:String, isCompleted: Bool = false){
    ToDoItems.append(["Name": itemName, "isCompleted": false])
    saveData()
}
func changeState (at item: Int) -> Bool{
    ToDoItems[item]["isCompleted"] =  !(ToDoItems[item]["isCompleted"] as! Bool)
    saveData()
    return  ToDoItems[item]["isCompleted"] as! Bool
}
func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
    saveData()
}

func saveData() {
    
}

func loadData() {

}
