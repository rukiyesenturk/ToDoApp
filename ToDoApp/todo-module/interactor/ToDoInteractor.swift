//
//  ToDoInteractor.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class ToDoInteractor: PresenterToInteractorToDo {
    var toDoPresenter: InteractorToPresenterToDo?
    
    let db: FMDatabase?
    
    init() {
        let destinationRoad = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dataBaseUrl = URL(fileURLWithPath: destinationRoad).appendingPathComponent("todolist.sqlite")
        db = FMDatabase(path: dataBaseUrl.path)
    }
    func uploadToDo() {
        var list = [ToDoList]()
        db?.open()
        do {
            let q = try db!.executeQuery("SELECT * FROM things", values: nil)
            while q.next() { //sonraki satıra geçecek satır bitene kadar
                let list_id = Int(q.string(forColumn: "thing_id"))!
                let thingToDo = q.string(forColumn: "thing_todo")!
                let toDo = ToDoList(list_id: list_id, thingToDo: thingToDo)
                list.append(toDo)
            }
            toDoPresenter?.sendDataToPresenter(toDoList: list)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func searchToDo(searchText: String) {
        var toDoList = [ToDoList]()
        db?.open()
        do {
            let q = try db!.executeQuery("SELECT * FROM things WHERE thing_todo like '%\(searchText)%'", values: nil)
            while q.next() {
                let toDo = ToDoList(list_id: Int(q.string(forColumn: "thing_id"))!, thingToDo: q.string(forColumn: "thing_todo")!)
                toDoList.append(toDo)
            }
            toDoPresenter?.sendDataToPresenter(toDoList: toDoList)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func deleteToDo(thing_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM things WHERE thing_id = ?", values: [thing_id])
            uploadToDo()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
