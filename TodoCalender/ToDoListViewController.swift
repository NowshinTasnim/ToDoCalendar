//
//  ToDoListViewController.swift
//  TodoCalender
//
//  Created by kuet on 27/10/19.
//  Copyright © 2019 kuet. All rights reserved.
//

import UIKit
//import FirebaseDatabase
//import FirebaseAuth

class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var TodoTableView: UITableView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var progressPercentage: UILabel!
    
    struct Todo{
        var isChecked: Bool
        var todoName: String
    }
    
    var userID: String?
    var todos: [Todo] = []
    var day = ""
    var month = ""
    var year:Int = 0
    var countComplete:Int = 0
    var countTodos:Int = 0
    var progP:Int = 0
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return todos.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todocell", for: indexPath) as! TodoCell
        
        cell.todoLabel.text = todos[indexPath.row].todoName
        
        if todos[indexPath.row].isChecked{
            cell.checkMarkImage.image = UIImage(named: "checkmark.png")
        }
        else{
            cell.checkMarkImage.image = nil
        }
        progP = countComplete * 100 / countTodos
        progressPercentage.text = "\(progP)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let ref = Database.database().reference(withPath: "users").child(userID!).child("todos").child(todos[indexPath.row].todoName)
        
        if todos[indexPath.row].isChecked{
            todos[indexPath.row].isChecked = false
            countComplete -= 1
           // ref.updatChildValues(["isChecked": false])
        }
        else{
            todos[indexPath.row].isChecked = true
            countComplete += 1
           // ref.updatChildValues(["isChecked": true])
        }
        
        TodoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
          //  let ref = Database.database().reference(withPath: "users").child(userID!).child("todos").child(todos[indexPath.row].todoName)
            
            //ref.removeValue()
            todos.remove(at: indexPath.row)
            countTodos -= 1
            TodoTableView.reloadData()
        }
    }
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TodoTableView.delegate = self
        //TodoTableView.dataSource = self
        //TodoTableView.rowHeight = 80
 
       // if let uid = userID{
           date.text = " \(day) - \(month) - \(year)"
        //}
        
        //loadTodos()
    
    }
    /*
    @IBAction func addTodo(_ sender: Any) {
        
        let todoAlert = UIAlertController(title: "New Activity", message: "Add your activity", preferredStyle: .alert)
        
        todoAlert.addTextField()
        
        let addTodoAction = UIAlertAction(title: "Add", style: .default){ (action) in
            let todoText = todoAlert.textFields![0].text
            self.todos.append(Todo(isChecked: false, todoName: todoText!))
            let ref = Database.database().reference(withPath: "users").child(userID!).child("todos")
            ref.child(todoText!).setValue(["isChecked": false])
            countTodos += 1
            self.TodoTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        todoAlert.addAction(addTodoAction)
        todoAlert.addAction(cancelAction)
        
        present(todoAlert, animated: true, completion: nil)
    }
    
    func loadTodos(){
        let ref = Database.database().reference(withPath: "users").child(userID!).child("todos")
        
        ref.observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children.allObjects as! [DataSnapshot]{
                let todoName = child.key
                let todoRef = ref.child(todoName)
                
                todoRef.observeSingleEvent(of: .value, with: {(todoSnapshot) in
                    let value = todoSnapshot.value as? NSDictionary
                    let isChecked = value!["isChecked"] as? Bool
                    self.todos.append(Todo(isChecked: isChecked!, todoName: todoName))
                    self.TodoTableView.reloadData()
                })
            }
            
        }
    }

    */

}
