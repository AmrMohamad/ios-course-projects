//
//  ViewController.swift
//  Todoey-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [TodoItem]()
    let dataPath  = FileManager
        .default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first?.appending(path: "Items.plist")
    
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
        
        tableView.deselectRow(at: indexPath, animated: true)
        let item = itemArray[indexPath.row]
        item.done = !item.done
        saveData()
    }
    
    //MARK: - Add Item
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        var textfieldOfAlert = UITextField()
        let newItem = TodoItem()
        let alert = UIAlertController(
            title: "Add New ToDo Item",
            message: "",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Add Item",
            style: .default) { [self] action in
                newItem.title = textfieldOfAlert.text!
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
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataPath!)
        } catch {
            print("Error with encoding \(error)")
        }
        self.tableView.reloadData()
    }
    
    //MARK: - Add encoded custom data to plist file use NSCoder
    func loadItems(){
        if let data = try? Data(contentsOf: dataPath!){
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([TodoItem].self, from: data)
            } catch {
                print("Error with decoding \(error)")
            }
        }
    }
}

