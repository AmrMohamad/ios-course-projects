//
//  ViewController.swift
//  Todoey-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       loadItems()
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
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let item = itemArray[indexPath.row]
//        How to Delete Items : 👇🏻
//        context.delete(item)
//        itemArray.remove(at: indexPath.row)
        
        item.done = !item.done
        tableView.deselectRow(at: indexPath, animated: true)
        
        saveData()
    }
    
    //MARK: - Add Item
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        var textfieldOfAlert = UITextField()
        let newItem = Item(context: self.context)
        let alert = UIAlertController(
            title: "Add New ToDo Item",
            message: "",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Add Item",
            style: .default) { [self] action in
                newItem.title = textfieldOfAlert.text!
                newItem.done  = false
                self.itemArray.append(newItem)
                self.saveData()
            }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textfieldOfAlert = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //MARK: - Add encoded custom data to plist file use NSCoder
    
    func saveData(){
        do {
            try context.save()
        } catch {
            print("Error Saving context \(error)")
        }
        self.tableView.reloadData()
    }
    
    //MARK: - Add encoded custom data to plist file use NSCoder
    func loadItems(){
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error with Fetching data By CoreData \(error)")
        }
        
    }
}

