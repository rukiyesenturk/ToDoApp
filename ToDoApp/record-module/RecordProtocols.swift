//
//  RecordProtocols.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

protocol ViewToPresenterRecord {
    var recordInteractor: PresenterToInteractorRecord? {get set}
    func add(thingToDo: String)
}
protocol PresenterToInteractorRecord {
    func toDoAdd(thingToDo: String)
}
protocol PresenterToRouterRecord {
    static func createModule(ref: RecordVC)
}
