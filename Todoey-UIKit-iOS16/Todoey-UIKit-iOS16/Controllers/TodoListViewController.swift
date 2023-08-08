//
//  ViewController.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit
import RealmSwift

class TodoListViewController: UITableViewController {
    
    var todoItems: Results<Item>?
    let realm = try! Realm()
    
    var selectedCategory: Category? {
        didSet{
            loadItems()
            BigTitleNavigationBar(title: selectedCategory!.name)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            return todoItems?.count ?? 1
        }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ToDoItemCell",
                for: indexPath
            )
            
            if let item = todoItems?[indexPath.row] {
                cell.textLabel?.text = item.title
                cell.accessoryType = item.done ? .checkmark : .none
            } else {
                cell.textLabel?.text = "No items added yet"
            }
            return cell
        }
    
        //MARK: - Deleagte Methods
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            if let item = todoItems?[indexPath.row] {
                do{
                    try realm.write({
                        item.done = !item.done
                    })
                }catch{
                    print("Error saving \(error)")

                }
            }
            tableView.reloadData()
            tableView.deselectRow(at: indexPath, animated: true)
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
            if let currentCatogery = self.selectedCategory {
                do {
                    try self.realm.write({
                        let newItem         = Item()
                        newItem.title       = alertOfTextField.text!
                        newItem.dateCreated = Date()
                        currentCatogery.items.append(newItem)
                    })
                } catch{
                    print("Error saving with Realm \(error)")
                }
                self.tableView.reloadData()
            }
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //MARK: - Saving/Writing Custom Data using NSCoder
    
    //    func saveItem(){
    //
    //        do {
    //            try context.save()
    //        } catch {
    //            print("Error with saving data \(error)")
    //        }
    //        tableView.reloadData()
    //    }
    //
    
    //MARK: - Loading/Reading Custom Data using NSCoder
    
    func loadItems(){
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
    }
}

