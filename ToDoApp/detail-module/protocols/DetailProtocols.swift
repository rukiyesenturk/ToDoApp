//
//  DetailProtocols.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

protocol ViewToPresenterDetail {
    var detailInteractor: PresenterToInteractorDetail? {get set}
    
    func update(thing_id: Int, thing_todo: String)
}
protocol PresenterToInteractorDetail {
    func toDoUpdate(thing_id: Int, thing_todo: String)
}
protocol PresenterToRouterDetail {
    static func createModule(ref: DetasilVC)
}
