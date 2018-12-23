//
//  number.swift
//  tach data source va delegate
//
//  Created by daicudu on 11/24/18.
//  Copyright © 2018 daicudu. All rights reserved.
//

import UIKit

class NumberData: NSObject, UITableViewDataSource {
        
    var numbers = [Int](1...5)
    
    var mainNumber : TableViewController?
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(numbers[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)  {
        if editingStyle == .delete {
            numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            mainNumber?.noData = numbers.count == 0
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

}
