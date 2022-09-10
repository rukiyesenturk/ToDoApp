//
//  RecordVC.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import UIKit

class RecordVC: UIViewController {

    @IBOutlet weak var tfToDoWork: UITextField!
    
    var recordPresenter: ViewToPresenterRecord?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RecordRouter.createModule(ref: self)
    }
    

    @IBAction func btnAdd(_ sender: Any) {
        if let thing = tfToDoWork.text {
            recordPresenter?.add(thingToDo: thing)
            
        }
    }
    
}
