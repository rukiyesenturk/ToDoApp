//
//  DetailInteractor.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class DetailInteractor: PresenterToInteractorDetail {
    let db: FMDatabase?
    
    init() {
        let destinationRoad = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dataBaseUrl = URL(fileURLWithPath: destinationRoad).appendingPathComponent("todolist.sqlite")
        db = FMDatabase(path: dataBaseUrl.path)
    }
    
    func toDoUpdate(thing_id: Int, thing_todo: String) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE things SET thing_todo = ? WHERE thing_id = ?", values: [thing_todo,thing_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
