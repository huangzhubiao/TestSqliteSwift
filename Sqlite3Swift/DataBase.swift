//
//  DataBase.swift
//  Sqlite3Swift
//
//  Created by hzb on 2018/4/21.
//  Copyright © 2018年 Lumen. All rights reserved.
//

import UIKit
import SQLite

class DataBase: NSObject {
    var db:Connection!
    
    let TABLE_USER = Table("talble_user")
    let TABLE_USER_ID = Expression<Int64>("user_id")
    let TABLE_USER_TELEPHONE = Expression<String>("user_telephone")
    let TABLE_USER_NAME = Expression<String>("user_name")
    
    override init() {
        super.init()
        self.connectDatabase()
    }
    //connect data sqlite
   func connectDatabase(filePath:String = "/Documents") ->Void{
        let sqlFilePath = NSHomeDirectory() + filePath + "/db.sqlite3"
    
        do {
            db = try Connection(sqlFilePath)
            print("connect success")
        } catch {
            print("connect failed")
        }
    }
    //create table_user
    func tableUserCreate() -> Void {
        do {
            try db.run(TABLE_USER.create{table in
                table.column(TABLE_USER_ID, primaryKey: .autoincrement)
                table.column(TABLE_USER_TELEPHONE)
                table.column(TABLE_USER_NAME)
            })
            print("create table success")
        } catch  {
            print("create table failed")
        }
    }
    
    //insert data
    func tableUserInsertItem(telephone:String,name:String) -> Void {
        let insert = TABLE_USER.insert(TABLE_USER_TELEPHONE <- telephone,TABLE_USER_NAME <- name)
        do {
            let rowid = try db.run(insert)
            print("insert data success id :\(rowid)")
        } catch  {
            print("insert data failed:\(error)")
        }
    }
    
    //query
    func queryTableUser() -> Void {
        for item in (try! db.prepare(TABLE_USER)) {
            print("user query--id:\(item[TABLE_USER_ID]) telephone:\(item[TABLE_USER_TELEPHONE])  name:\(item[TABLE_USER_NAME])")
        }
    }
    
}
