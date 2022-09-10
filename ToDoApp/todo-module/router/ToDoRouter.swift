//
//  ToDoRouter.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class ToDoRouter: PresenterToRouterToDo {
    static func createModule(ref: ToDoVC) {
        let presenter = ToDoPresenter()
        ref.toDoPresenter = presenter
        ref.toDoPresenter?.toDoInteractor = ToDoInteractor()
        ref.toDoPresenter?.toDoView = ref
        ref.toDoPresenter?.toDoInteractor?.toDoPresenter = presenter
    }
    
    
}
