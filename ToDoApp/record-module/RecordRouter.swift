//
//  RecordRouter.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class RecordRouter: PresenterToRouterRecord {
    static func createModule(ref: RecordVC) {
        ref.recordPresenter = RecordPresenter()
        ref.recordPresenter?.recordInteractor = RecordInteractor()
    }
    
    
}
