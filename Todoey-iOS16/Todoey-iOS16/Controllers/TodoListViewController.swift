//
//  ViewController.swift
//  Todoey-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Apples","Eggs","Milk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - TableView DataSource Methods
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return itemArray.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(
                withIdentifier: "ToDoItemCell",
                for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        
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
    
    //MARK: - Add Item
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        var textfieldOfAlert = UITextField()
        
        let alert = UIAlertController(
            title: "Add New ToDo Item",
            message: "",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Add Item",
            style: .default) { action in
                self.itemArray.append(textfieldOfAlert.text!)
                self.tableView.reloadData()
            }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textfieldOfAlert = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

