//
//  TableViewController.swift
//  tach data source va delegate
//
//  Created by daicudu on 11/24/18.
//  Copyright © 2018 daicudu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var switchItem: UISwitch!
    @IBOutlet var noDataView: UIView!
    
    @IBOutlet weak var footerView: UIView!
    var stringData = StringData()
    var numberData = NumberData()
    
    
    var noData: Bool = true {
        didSet {
//            noData ? (tableView.tableFooterView = noDataView) : (tableView.tableFooterView = whiteView)
            tableView.tableFooterView = noData ? noDataView : footerView
        }
    }
    // On la ABC
    // Off la 123
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = stringData
        stringData.mainString = self
        
        numberData.mainNumber = self

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noData = switchItem.isOn ? (stringData.string1.count == 0 ) : (numberData.numbers.count == 0)
        tableView.reloadData()
        
        
        
//        noData = switchItem.isOn ? (stringData.string1.count == 0) : (numberData.numbers.count == 0)
//        tableView.reloadData()
        
    }
   

    // MARK: - Table view data source

    @IBAction func `switch`(_ sender: UISwitch) {

        tableView.dataSource = sender.isOn ? stringData : numberData
        // 2 cai tuong tu nhau nhung cai tren ngan hon
//        sender.isOn ? (tableView.dataSource = stringData) : (tableView.dataSource = numberData)
        
        noData = sender.isOn ? (stringData.string1.count == 0) : (numberData.numbers.count == 0)
        //
        tableView.reloadData()
               // tuong tu nhu nhu vay nhung cai tren cung ngan hon
//        sender.isOn ? (noData = (stringData.string1.count == 0)) : (noData = (numberData.numbers.count == 0))
//        tableView.reloadData()
    }
 

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                if switchItem.isOn {
                    destination.dataDetail = stringData.string1[indexPath.row]
                }else{
                    destination.dataDetail = String(numberData.numbers[indexPath.row])
                }
            }
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let sources = unwindSegue.source as? ViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                 switchItem.isOn ? (stringData.string1[indexPath.row] = sources.dataDetail ?? "") : (numberData.numbers[indexPath.row] = Int(sources.dataDetail ?? "") ?? 0)
                
                
            } else {
                switchItem.isOn ? (stringData.string1.append(sources.dataDetail ?? "")) : (numberData.numbers.append(Int(sources.dataDetail ?? "") ?? 0))
            }
        }
        tableView.reloadData()
//            if let indexPath = tableView.indexPathForSelectedRow {
//               if switchItem.isOn {
//                stringData.string1[indexPath.row] = sources.dataDetail ?? ""
////                stringData.string1.append(sources.dataDetail ?? "")
//               } else {
//                numberData.numbers[indexPath.row] = Int(sources.dataDetail ?? "") ?? 0
////                numberData.numbers.append(Int(sources.dataDetail ?? "") ?? 0)
//                }
//                tableView.reloadData()
//                // switchItem.isOn
////                switchItem.isOn ? (stringData.string1[indexPath.row] = sources.dataDetail!) : (numberData.numbers[indexPath.row] = Int(sources.dataDetail!) ?? 0)
////                if tableView.dataSource === numberData {
////                    numberData.numbers[indexPath.row] = Int(sources.dataDetail!) ?? 0
////                }else{
//////                    numberData.numbers.append(Int(sources.dataDetail!)) ?? 0
////                    stringData.string1[indexPath.row] = sources.dataDetail!
////                }
//            }
//            else {
//
//                    switchItem.isOn ? (stringData.string1.append(sources.dataDetail!)) : (numberData.numbers.append(Int(sources.dataDetail!) ?? 0))
//
//
//                // cái trên thay cho cái dưới
//
////                if tableView.dataSource === numberData {
////                    numberData.numbers.append(Int(sources.dataDetail!) ?? 0)
////                }else{
////                    stringData.string1.append(sources.dataDetail!)
////
////                }
//            }
        }
    }

