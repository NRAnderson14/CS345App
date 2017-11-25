//
//  DataMethods.swift
//  CS345AppBackend
//
//  Created by Anderson, Nathan R on 11/12/17.
//  Copyright © 2017 Anderson, Nathan R. All rights reserved.
//

import Foundation
import SQLite

let path = NSSearchPathForDirectoriesInDomains(
    .documentDirectory, .userDomainMask, true
).first!

let accounts = Table("accounts")
let id = Expression<Int64>("id")
let firstName = Expression<String>("firstName")
let lastName = Expression<String>("lastName")
let userStore = Expression<Int64>("userStore")

let stores = Table("stores")
let storeID = Expression<Int64>("store")
let storeName = Expression<String>("storeName")
let address = Expression<String>("address")

let appointments = Table("appointments")
let appointmentID = Expression<Int64>("appointmentID")
let userID = Expression<Int64>("userID")
let apptTime = Expression<String>("appointmentTime")


func createDB() -> Void {
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        
        try DB.run(accounts.create(ifNotExists: true) { t in
            t.column(id, primaryKey: .autoincrement)
            t.column(firstName)
            t.column(lastName)
            t.column(userStore)
        })
        
        try DB.run(stores.create(ifNotExists: true) { t in
            t.column(storeID, primaryKey: .autoincrement)
            t.column(storeName)
            t.column(address)
        })
        
        try DB.run(appointments.create(ifNotExists: true) { t in
            t.column(appointmentID, primaryKey: .autoincrement)
            t.column(userID)
            t.column(apptTime)
            t.column(storeID)
            t.foreignKey(userID, references: accounts, id)
            t.foreignKey(storeID, references: stores, storeID)
        })
    } catch {
        print(error)
    }
}

func addStore(name: String, storeAddress: String) -> Void {
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        
        try DB.run(stores.insert(storeName <- name, address <- storeAddress))
    } catch {
        print(error)
    }
}

func addAccount(userFirstName: String, userLastName: String, userHomeStore: Int64) -> Void {
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        
        try DB.run(accounts.insert(firstName <- userFirstName, lastName <- userLastName, userStore <- userHomeStore))
    } catch {
        print(error)
    }
}

func addAppointment(user: Int64, appointmentTime: String, store: Int64) -> Void {
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        
        try DB.run(appointments.insert(userID <- user, apptTime <- appointmentTime, storeID <- store))
    } catch {
        print(error)
    }
}

func getStores() -> [String] {
    var res: [String] = [String]()
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        
        for store in try DB.prepare(stores.select(storeName)) {
            res.append(store[storeName])
        }
        
    } catch {
        print(error)
    }
    
    return res
}

func delDB() -> Void {
    let fileman = FileManager.default
    do {
        let dbPath = "\(path)/db.sqlite3"
        
        try fileman.removeItem(atPath: dbPath)
        
    } catch {
        print(error)
    }
}
