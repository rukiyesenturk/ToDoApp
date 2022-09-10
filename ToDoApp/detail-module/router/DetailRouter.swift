//
//  DetailRouter.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class DetailRouter: PresenterToRouterDetail {
    static func createModule(ref: DetasilVC) {
        ref.detailPresenter = DetailPresenter()
        ref.detailPresenter?.detailInteractor = DetailInteractor()
    }
    
    
}
