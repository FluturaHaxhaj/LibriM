//
//  FMDBDatabaseModel.swift
//  LibriM
//
//  Created by Flutura Haxhaj on 7/15/20.
//  Copyright © 2020 Endrit Bajrami. All rights reserved.
//

import Foundation
import UIKit
let sharedInstance = FMDBDatabaseModel()
class FMDBDatabaseModel: NSObject {
    var databese:FMDatabase? = nil
    class func getInstance() -> FMDBDatabaseModel
    {
        if (sharedInstance.databese == nil)
        {
            sharedInstance.databese = FMDatabase(path: Util.getPath(fileName: "sql.sqlite"))
        }
        return sharedInstance
}
    
    // insert data into table
    func InsertData(_ Tbl_Info:Tbl_Info) -> Bool {
        sharedInstance.databese!.open()
        let isInserted = sharedInstance.databese!.executeUpdate("INSERT INTO Info(Libri,Autori) VALUES(?,?)", withArgumentsIn: [Tbl_Info.Libri,Tbl_Info.Autori])
        sharedInstance.databese!.close()
        return (isInserted != nil)
    }
    
    func GetAllData() -> NSMutableArray {
        sharedInstance.databese!.open()
        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("SELECT * FROM Info", withArgumentsIn: [0])
        let itemInfo:NSMutableArray = NSMutableArray ()
        if (resultSet != nil)
        {
            while resultSet.next() {
                let item:Tbl_Info = Tbl_Info()
                item.Id = Int(resultSet.int(forColumn: "Id"))
                item.Libri = String(resultSet.string(forColumn: "Libri")!)
                item.Autori = String(resultSet.string(forColumn: "Autori")!)
                itemInfo.add(item)
            }
        }
        sharedInstance.databese!.close()
        return itemInfo
    }
    func updateRecode(RecoreId:Int,Libri:String,Autori:String) -> NSMutableArray {
        sharedInstance.databese!.open()
        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("UPDATE Info SET Libri = ?,Autori = ? WHERE Id = ?", withArgumentsIn: [Libri,Autori,RecoreId])
        let itemInfo:NSMutableArray = NSMutableArray ()
        if (resultSet != nil)
        {
            while resultSet.next() {
                let item:Tbl_Info = Tbl_Info()
                item.Id = Int(resultSet.int(forColumn: "Id"))
                item.Libri = String(resultSet.string(forColumn: "Libri")!)
                item.Autori = String(resultSet.string(forColumn: "Autori")!)
                itemInfo.add(item)
            }
        }
        sharedInstance.databese!.close()
        return itemInfo
    }
    func deleteRecode(RecoreId:Int) -> NSMutableArray {
        sharedInstance.databese!.open()
        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("DELETE FROM Info WHERE Id = ?", withArgumentsIn: [RecoreId])
        let itemInfo:NSMutableArray = NSMutableArray ()
        if (resultSet != nil)
        {
            while resultSet.next() {
                let item:Tbl_Info = Tbl_Info()
                item.Id = Int(resultSet.int(forColumn: "Id"))
                item.Libri = String(resultSet.string(forColumn: "Libri")!)
                item.Autori = String(resultSet.string(forColumn: "Autori")!)
                itemInfo.add(item)
            }
        }
        sharedInstance.databese!.close()
        return itemInfo
    }
}
