//
//  TableTableViewController.swift
//  ToDOList
//
//  Created by Master on 26.08.2021.
//  Copyright © 2021 Master. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func pushEditAction(_ sender: Any) {
        tableView.setEditing(true, animated: true)
    }
    @IBAction func pushAddAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Create new task", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "New task name:"
        }
     let alertActionCancel = UIAlertAction(title: "Cancel", style: .default) { (alert) in
            
        }
        let alertActionCreate = UIAlertAction(title: "Create", style: .cancel) { (alert) in
            let newItem = alertController.textFields![0].text
            addItem(itemName: newItem!)
            self.tableView.reloadData()
           }
        alertController.addAction(alertActionCancel)
        alertController.addAction(alertActionCreate)
        present(alertController, animated: true, completion: nil)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDoItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentItem = ToDoItems[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        
        if (currentItem["isCompleted"] as? Bool) == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if changeState(at: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        
       
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
