//
//  DetailPresenter.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class DetailPresenter: ViewToPresenterDetail {
    var detailInteractor: PresenterToInteractorDetail?
    
    func update(thing_id: Int, thing_todo: String) {
        detailInteractor?.toDoUpdate(thing_id: thing_id, thing_todo: thing_todo)
    }
    
    
}
