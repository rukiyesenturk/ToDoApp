//
//  RecordInteractor.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class RecordInteractor: PresenterToInteractorRecord {
    let db: FMDatabase?
    
    init() {
        let destinationRoad = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dataBaseUrl = URL(fileURLWithPath: destinationRoad).appendingPathComponent("todolist.sqlite")
        db = FMDatabase(path: dataBaseUrl.path)
    }
    
    func toDoAdd(thingToDo: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO things (thing_todo) VALUES (?)", values: [thingToDo])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
