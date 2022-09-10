//
//  ViewController.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import UIKit

class ToDoVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var toDoList = [ToDoList]()
    var toDoPresenter: ViewToPresenterToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        ToDoRouter.createModule(ref: self)
        
        copyDataBase()
    }
    override func viewWillAppear(_ animated: Bool) {
        toDoPresenter?.upload()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let toDo = sender as? ToDoList {
                let gidilecekVC = segue.destination as! DetasilVC
                gidilecekVC.toDo = toDo
            }
        }
    }
    func copyDataBase(){
        let bundle = Bundle.main.path(forResource: "todolist", ofType: ".sqlite")
        let destinationRoad = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dataBaseUrl = URL(fileURLWithPath: destinationRoad).appendingPathComponent("todolist.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: dataBaseUrl.path) {
            print("Veri tabanı zaten var.")
        } else {
            do{
                try fm.copyItem(atPath: bundle!, toPath: dataBaseUrl.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
extension ToDoVC: PresenterToViewToDo {
    func sendDataToView(toDoList: Array<ToDoList>) {
        self.toDoList = toDoList
        self.tableView.reloadData()
    }
}
extension ToDoVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        toDoPresenter?.search(searchText: searchText)
    }
}
extension ToDoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDoList[indexPath.row]
        let thingsToDo = tableView.dequeueReusableCell(withIdentifier: "thingsToDo", for: indexPath) as! TableViewCell
        thingsToDo.lblThingsToDo.text = "\(toDo.thing_todo!)"
        
        return thingsToDo
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = self.toDoList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { (contextualAction, view, bool) in
            let toDo = self.toDoList[indexPath.row]
            print("To Do Delete: \(toDo.thing_id!)")
            
            let alert = UIAlertController(title: "Delete", message: "\(toDo.thing_id!) delete?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in}
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.toDoPresenter?.delete(thing_id: toDo.thing_id!)
            }
            
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            //aletin görüntülenmesi
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
