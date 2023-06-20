//
//  ViewController.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Eggs","Apples","aa"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Todoey"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem
            .rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(addItemPressed)
            )
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ToDoItemCell")
    }

    
    //MARK: - DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK: - Deleagte Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView
            .cellForRow(at: indexPath)?
            .accessoryType == .checkmark {
            tableView
                .cellForRow(at: indexPath)?
                .accessoryType = .none
        } else {
            tableView
                .cellForRow(at: indexPath)?
                .accessoryType = .checkmark
        }
    }
    
    //MARK: - Add item
    
    @objc func addItemPressed(){
        var alertOfTextField = UITextField()
        let alert = UIAlertController(
            title: "Add New ToDo Item",
            message: "",
            preferredStyle: .alert
        )
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            alertOfTextField = alertTextField
        }
        let action = UIAlertAction(
            title: "Add Item",
            style: .default
        ) { action in
                self.itemArray.append(alertOfTextField.text!)
                self.tableView.reloadData()
            }
        alert.addAction(action)
        present(alert, animated: true)
    }

}

