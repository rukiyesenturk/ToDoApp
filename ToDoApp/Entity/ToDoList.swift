//
//  ToDoList.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import Foundation

class ToDoList {
    
    var thing_id: Int?
    var thing_todo: String?
    
    init(list_id: Int, thingToDo: String) {
        self.thing_id = list_id
        self.thing_todo = thingToDo
    }
}
