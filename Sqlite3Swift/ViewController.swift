//
//  ViewController.swift
//  Sqlite3Swift
//
//  Created by hzb on 2018/4/21.
//  Copyright © 2018年 Lumen. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    var database:DataBase!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

         database = DataBase()
    }
    @IBAction func connectDatabase(_ sender: Any) {
    }
    
    @IBAction func createTable(_ sender: Any) {
         database.tableUserCreate()
    }
    
    @IBAction func insertItem(_ sender: Any) {
        database.tableUserInsertItem(telephone: "1123456", name: "lisi")
    }
    @IBAction func query(_ sender: Any) {
        database.queryTableUser()
    }
}

