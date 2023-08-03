//
//  ViewController.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
//    var itemArray = [Item]()
//    let context   = (
//        UIApplication
//            .shared
//            .delegate as! AppDelegate
//    ).persistentContainer
//        .viewContext
//
//    var selectedCategory: Category? {
//        didSet{
//            loadItems()
//            BigTitleNavigationBar(title: selectedCategory!.name!)
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem
//            .rightBarButtonItem = UIBarButtonItem(
//                barButtonSystemItem: .add,
//                target: self,
//                action: #selector(addItemPressed)
//            )
//
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ToDoItemCell")
        
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
//
//        let item = itemArray[indexPath.row]
//
////        How to Delete Items : 👇🏻
////        context.delete(item)
////        itemArray.remove(at: indexPath.row)
//
//        item.done = !item.done
//        saveItem()
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    //MARK: - Add item
    
//    @objc func addItemPressed(){
//        var alertOfTextField = UITextField()
//
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
//            let newItem = Item(context: self.context)
//            newItem.title = alertOfTextField.text!
//            newItem.done  = false
//            newItem.parentCategory = self.selectedCategory
//            self.itemArray.append(newItem)
//            self.saveItem()
//        }
//        alert.addAction(action)
//        present(alert, animated: true)
//    }
    
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
//
//    func loadItems(
//        with request:NSFetchRequest<Item> = Item.fetchRequest(),
//        predicate: NSPredicate? = nil
//    ){
//
//        do {
//            let categoryPredicate = NSPredicate(
//                format: "parentCategory.name MATCHES %@",
//                selectedCategory!.name!
//            )
//            request.predicate = categoryPredicate
//            itemArray = try context.fetch(request)
//        } catch {
//            print("Error with Fetching data By CoreData \(error)")
//        }
//        tableView.reloadData()
//    }
}

