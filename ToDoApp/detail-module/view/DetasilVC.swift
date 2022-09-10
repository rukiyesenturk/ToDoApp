//
//  DetasilVC.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import UIKit

class DetasilVC: UIViewController {

    @IBOutlet weak var tfToDoWork: UITextField!
    
    var toDo: ToDoList?
    var detailPresenter: ViewToPresenterDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailRouter.createModule(ref: self)
        if let toDo = toDo {
            tfToDoWork.text = toDo.thing_todo
        }
    
    }
    @IBAction func btnUpdate(_ sender: Any) {
        if let toDoWork = tfToDoWork.text, let toDo = toDo {
            detailPresenter?.update(thing_id: toDo.thing_id!, thing_todo: toDoWork)
        }
    }
    
}
