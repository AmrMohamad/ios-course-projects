//
//  ViewController.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit
import RealmSwift
import SwipeCellKit
import ChameleonFramework

class TodoListViewController: SwipeTableViewController {
    
    var todoItems: Results<Item>?
    let realm = try! Realm()
    let search = UISearchController(searchResultsController: nil)
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
        
        tableView.register(SwipeTableViewCell.self, forCellReuseIdentifier: "ToDoItemCell")
        
        
        search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let colorOfCategory = selectedCategory?.colorOfCategory {
            guard let navBar = navigationController?
                .navigationBar else {
                fatalError("Navigation Bar not exist YET")
            }
            if let navBarColor = UIColor(hexString: colorOfCategory) {
                view.backgroundColor   = navBarColor
                let contrastColor = ContrastColorOf(navBarColor, returnFlat: true)
                navBar.barTintColor    = navBarColor
                navBar.backgroundColor = navBarColor
                navBar.tintColor = contrastColor
                navBar.largeTitleTextAttributes = [
                    .foregroundColor : contrastColor
                ]
                navBar.titleTextAttributes = [
                    .foregroundColor : contrastColor
                ]
                let searchBar = search.searchBar
                searchBar.searchTextField.backgroundColor = contrastColor
                searchBar.tintColor                 = contrastColor
                searchBar.searchTextField.textColor = navBarColor
                searchBar.searchTextField.tintColor = navBarColor
                searchBar.searchTextField.leftView?.tintColor = navBarColor
                searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
                    string: "Search", attributes: [
                        .foregroundColor : navBarColor.darken(byPercentage: 0.3)!
                    ]
                )
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let navBar = navigationController?
            .navigationBar else {fatalError("Navigation controller not exist yet")}
        navBar.barTintColor = UINavigationController().navigationBar.barTintColor
        navBar.backgroundColor = UINavigationController().navigationBar.backgroundColor
        navBar.tintColor    = UIColor.tintColor
        
        navBar.largeTitleTextAttributes  = [
            .foregroundColor : UIColor.label
        ]
        navBar.titleTextAttributes = [
            .foregroundColor : UIColor.label
        ]
    }
    
    
    //MARK: - DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        super.identifierOfCell = "ToDoItemCell"
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            
            if let colorOfCategory = UIColor(
                hexString: selectedCategory!.colorOfCategory
            )?.darken(byPercentage:
                        (CGFloat(indexPath.row)/CGFloat(todoItems!.count))
            ){
                cell.backgroundColor = colorOfCategory
                cell.textLabel?.textColor = ContrastColorOf(colorOfCategory, returnFlat: true)
            }
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
                    //  realm.delete(item)
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
    
    override func updateModel(at indexPath: IndexPath) {
        do {
            if let itemForDeletion = todoItems?[indexPath.row] {
                try realm.write({
                    realm.delete(itemForDeletion)
                })
            }
        }catch{
            print("Error with deleting \(error)")
        }
    }
}

extension TodoListViewController: UISearchBarDelegate,UISearchControllerDelegate  {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadItems()
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        todoItems = todoItems?
            .filter("title CONTAINS[cd] %@", searchBar.text!)
            .sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
    }
}
