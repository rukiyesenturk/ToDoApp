//
//  RecordPresenter.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class RecordPresenter: ViewToPresenterRecord {
    var recordInteractor: PresenterToInteractorRecord?
    
    func add(thingToDo: String) {
        recordInteractor?.toDoAdd(thingToDo: thingToDo)
    }
    
    
}
