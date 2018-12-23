//
//  String.swift
//  tach data source va delegate
//
//  Created by daicudu on 11/24/18.
//  Copyright © 2018 daicudu. All rights reserved.
//

import UIKit

class StringData: NSObject, UITableViewDataSource {
   
    
    var string1 = ["a","b","c"]
    var mainString : TableViewController?
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return string1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = string1[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)  {
        if editingStyle == .delete {
            string1.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            mainString?.noData = string1.count == 0
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
