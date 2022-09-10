//
//  ToDoProtocols.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

protocol ViewToPresenterToDo {
    var toDoInteractor: PresenterToInteractorToDo? {get set}
    var toDoView: PresenterToViewToDo? {get set}
    
    func upload()
    func search(searchText: String)
    func delete(thing_id: Int)
}
protocol PresenterToInteractorToDo {
    var toDoPresenter: InteractorToPresenterToDo? {get set}
    func uploadToDo()
    func searchToDo(searchText: String)
    func deleteToDo(thing_id: Int)
}

protocol InteractorToPresenterToDo {
    func sendDataToPresenter(toDoList: Array<ToDoList>)
}
protocol PresenterToViewToDo {
    func sendDataToView(toDoList: Array<ToDoList>)
}

protocol PresenterToRouterToDo {
    static func createModule(ref: ToDoVC)
}
