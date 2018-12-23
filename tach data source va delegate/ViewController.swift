//
//  ViewController.swift
//  tach data source va delegate
//
//  Created by daicudu on 11/25/18.
//  Copyright © 2018 daicudu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewTextFied: UITextField!
    
    var dataDetail: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataDetail != nil {
            viewTextFied.text = dataDetail
        }

        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        dataDetail = viewTextFied.text
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
