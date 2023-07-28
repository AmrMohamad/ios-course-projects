//
//  ViewController.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit

class TodoListViewController: UITableViewController {

//    var itemArray = [Item]()
//    let dataPath  = FileManager
//        .default
//        .urls(for: .documentDirectory, in: .userDomainMask)
//        .first?.appending(path: "Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        BigTitleNavigationBar(title: "Todoey")
//        navigationItem
//            .rightBarButtonItem = UIBarButtonItem(
//                barButtonSystemItem: .add,
//                target: self,
//                action: #selector(addItemPressed)
//            )
//
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ToDoItemCell")
//
//        loadData()
    }

    
    //MARK: - DataSource Methods
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemArray.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
//        let item = itemArray[indexPath.row]
//        cell.textLabel?.text = item.title
//        cell.accessoryType = item.done ? .checkmark : .none
//        return cell
//    }
//    
//    //MARK: - Deleagte Methods
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let item = itemArray[indexPath.row]
//        item.done = !item.done
//        saveData()
//    }
//    
//    //MARK: - Add item
//    
//    @objc func addItemPressed(){
//        var alertOfTextField = UITextField()
//        let newItem = TodoItem()
//        let alert = UIAlertController(
//            title: "Add New ToDo Item",
//            message: "",
//            preferredStyle: .alert
//        )
//        alert.addTextField { alertTextField in
//            alertTextField.placeholder = "Create New Item"
//            alertOfTextField = alertTextField
//        }
//        let action = UIAlertAction(
//            title: "Add Item",
//            style: .default
//        ) { action in
//            newItem.title = alertOfTextField.text!
//            self.itemArray.append(newItem)
//            self.saveData()
//        }
//        alert.addAction(action)
//        present(alert, animated: true)
//    }
//
//    //MARK: - Saving/Writing Custom Data using NSCoder
//    
//    func saveData(){
//        let encoder = PropertyListEncoder()
//        do {
//            let data = try encoder.encode(itemArray)
//            try data.write(to: dataPath!)
//        } catch {
//            print("Error with encoding data \(error)")
//        }
//        self.tableView.reloadData()
//    }
//    
//    
//    //MARK: - Loading/Reading Custom Data using NSCoder
//    
//    func loadData(){
//        if let data = try? Data(contentsOf: dataPath!) {
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([TodoItem].self, from: data)
//            } catch {
//                print("Error with Decoding \(error) ")
//            }
//        }
//    }
}

