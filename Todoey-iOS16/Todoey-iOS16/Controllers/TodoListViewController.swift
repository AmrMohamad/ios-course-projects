//
//  ViewController.swift
//  Todoey-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit
import RealmSwift

class TodoListViewController: UITableViewController {
    
    var todoItems : Results<Item>?
    let realm = try! Realm()
    
    var selectedCategory: Category? {
        didSet{
            loadItems()
            title = selectedCategory!.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        let search = UISearchController(searchResultsController: nil)
        //        search.delegate = self
        //        search.searchBar.delegate = self
        //        self.navigationItem.searchController = search
    }
    
    //MARK: - TableView DataSource Methods
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(
                withIdentifier: "ToDoItemCell",
                for: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
            
        } else {
            
            cell.textLabel?.text = "No items added yet"
        }
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        
        if let item = todoItems?[indexPath.row] {
            do{
                try realm.write({
                    item.done = !item.done
                })
                
            } catch {
                print("Error saving \(error)")
            }
        }
        tableView.reloadData()
        //        let item = todoItems?[indexPath.row]
        //        How to Delete Items : 👇🏻
        //        context.delete(item)
        //        itemArray.remove(at: indexPath.row)
        
        //        item.done = !item.done
        tableView.deselectRow(at: indexPath, animated: true)
        
        //        saveData()
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
            style: .default) { [self] action in
                
                if  let currentCategory = self.selectedCategory {
                    do {
                        try self.realm.write{
                            let newItem = Item()
                            newItem.title = textfieldOfAlert.text!
                            currentCategory.items.append(newItem)
                        }
                    } catch {
                        print("Error saving with Realm \(error)")
                    }
                }
                self.tableView.reloadData()
            }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textfieldOfAlert = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //MARK: - Saving data to DB by using CoreData
    
    //    func saveData(){
    //        do {
    //            try context.save()
    //        } catch {
    //            print("Error Saving context \(error)")
    //        }
    //        self.tableView.reloadData()
    //    }
    
    //MARK: - Reading/Loading data from DB by using CoreData
    func loadItems(
        
    ){
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
        //        let categoryPredicate = NSPredicate(
        //            format: "parentCategory.name MATCHES %@", selectedCategory!.name!
        //        )
        //
        //        if let additionalPredicate = predicate {
        //
        //            request.predicate = NSCompoundPredicate(
        //                andPredicateWithSubpredicates: [
        //                    additionalPredicate,
        //                    categoryPredicate
        //                ]
        //            )
        //
        //        } else {
        //            request.predicate = categoryPredicate
        //        }
        //
        //        do {
        //            itemArray = try context.fetch(request)
        //        } catch {
        //            print("Error with Fetching data By CoreData \(error)")
        //        }
    }
}

//MARK: - Search Bar Methods
//
//extension TodoListViewController: UISearchBarDelegate,UISearchControllerDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let request : NSFetchRequest<Item> = Item.fetchRequest()
//
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//        loadItems(with: request, predicate: predicate)
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            loadItems()
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
//}
