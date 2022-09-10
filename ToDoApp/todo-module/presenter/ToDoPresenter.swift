//
//  ToDoPresenter.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class ToDoPresenter: ViewToPresenterToDo {
    var toDoInteractor: PresenterToInteractorToDo?
    
    var toDoView: PresenterToViewToDo?
    
    func upload() {
        toDoInteractor?.uploadToDo()
    }
    
    func search(searchText: String) {
        toDoInteractor?.searchToDo(searchText: searchText)
    }
    
    func delete(thing_id: Int) {
        toDoInteractor?.deleteToDo(thing_id: thing_id)
    }
    
}
extension ToDoPresenter: InteractorToPresenterToDo {
    func sendDataToPresenter(toDoList: Array<ToDoList>) {
        toDoView?.sendDataToView(toDoList: toDoList)
    }
}
