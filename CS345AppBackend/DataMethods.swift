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
let apptDetails = Expression<String>("appointmentDetails")


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
            t.column(apptDetails)
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

func addAppointment(user: Int64, store: Int64, appointmentTime: String, appointmentDetails: String) -> Void {
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        
        try DB.run(appointments.insert(userID <- user, apptTime <- appointmentTime, apptDetails <- appointmentDetails, storeID <- store))
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

func getAppointments() -> [(time: String, details: String)] {
    var res: [(time: String, details: String)] = [(time: String, details: String)]()
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        
        for appt in try DB.prepare(appointments.select(apptDetails, apptTime)) {
            res.append((appt[apptTime], appt[apptDetails]))
        }
        
    } catch {
        print(error)
    }
    
    return res
    
}

func getUserStore(_ userID: Int64) -> (name: String, address: String) {
    var userStoreID: Int64
    var nameRes: String = ""
    var addressRes: String = ""
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        //SELECT name, address FROM stores WHERE storeID = (SELECT userStore FROM accounts WHERE id = userID);
        let storeIDQuery = accounts.select(userStore)
                                   .filter(id == userID)
        let idqr = try DB.pluck(storeIDQuery)
        userStoreID = idqr![userStore]
        
        let storeQuery = stores.select(storeName, address)
                               .filter(storeID == userStoreID)
        let sqr = try DB.pluck(storeQuery)
        nameRes = sqr![storeName]
        addressRes = sqr![address]
        
    } catch {
        print(error)
    }
    
    return (nameRes, addressRes)
    
}

func updateStore(_ storeID: Int64) -> Void {
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        let user = accounts.filter(id == 1)    //Only one account for now
        try DB.run(user.update(userStore <- storeID))
    } catch {
        print(error)
    }
}

func selectFromAppointmentsWithText(text: String) -> (time: String, details: String) {
    var timeRes: String = ""
    var detailsRes: String = ""
    
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        let query = appointments.select(apptTime, apptDetails).filter(apptDetails == text)
        let queryRes = try DB.pluck(query)
        
        timeRes = queryRes![apptTime]
        detailsRes = queryRes![apptDetails]
    } catch {
        print(error)
    }
    
    return (timeRes, detailsRes)
    
}

func updateAppointmentsWithText(text: String, date: String) -> Void {
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        let appt = appointments.filter(apptDetails == text)
        try DB.run(appt.update(apptTime <- date))
        
    } catch {
        print(error)
    }
}

func deleteAppointmentWithText(text: String) -> Void {
    do {
        let DB = try Connection("\(path)/db.sqlite3")
        let appt = appointments.filter(apptDetails == text)
        try DB.run(appt.delete())
        
    } catch {
        print(error)
    }
}




///////////////////////////////////////////////////////////////////////////////////////////////
////////////////                Testing                    ////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
func dbExists() -> Bool {
    let fileman = FileManager.default
    var res: Bool = false
    let dbPath = "\(path)/db.sqlite3"
    res = fileman.isWritableFile(atPath: dbPath)
    
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

func populateData() -> Void {
    addStore(name: "CarZone", storeAddress: "1842 W. East St")
    addStore(name: "AutoMax", storeAddress: "450 Hwy 33")
    addAccount(userFirstName: "John", userLastName: "Doe", userHomeStore: 1)
    addAppointment(user: 1, store: 1, appointmentTime: "Dec 15 at 04:15", appointmentDetails: "Oil change")
}
