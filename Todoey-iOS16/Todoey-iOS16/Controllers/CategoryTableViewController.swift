//
//  CategoryTableViewController.swift
//  Todoey-iOS16
//
//  Created by Amr Mohamad on 17/07/2023.
//

import UIKit
import RealmSwift


class CategoryTableViewController: SwipeTableViewController {

    let realm = try! Realm()
    var categories : Results<Category>?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        tableView.rowHeight = 60.0
    }

    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories?.count ?? 1
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        super.identifierOfCell = "categoryOfItems"
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category added yet"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return cell
    }
    
    //MARK: - Add New Cetegories
    @IBAction func addCategoryButtonPressed(_ sender: UIBarButtonItem) {
        var textfieldOfAlert = UITextField()
        let alert = UIAlertController(title: "Add New Category",
                                      message: nil,
                                      preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Add Category",
            style: .default) { action in
                let newCategory = Category()
                newCategory.name = textfieldOfAlert.text!
                
                self.save(category: newCategory)
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Name the new category"
            textfieldOfAlert = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //MARK: - TabView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            
            destinationVC.selectedCategory = categories?[indexPath.row]
            
        }
        
    }
    
    //MARK: - Data Operations Methods
    func save(category: Object){
        do {
            try realm.write({
                realm.add(category)
            })
        } catch {
            print("Error Saving Data \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadCategories(){
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        do {
            print("\n ============= Overrided Update work ============== \n")
            try self.realm.write {
                if let categoryForDeletion = self.categories?[indexPath.row] {
                    self.realm.delete(categoryForDeletion)
                }
            }
        } catch {
            print("Error with deleting \(error)")
        }
    }
}

//extension CategoryTableViewController: SwipeTableViewCellDelegate {
//    func tableView(
//        _ tableView: UITableView,
//        editActionsForRowAt indexPath: IndexPath,
//        for orientation: SwipeActionsOrientation
//    ) -> [SwipeAction]? {
//        guard orientation == .right else { return nil }
//
//        let deleteAction = SwipeAction(
//            style: .destructive,
//            title: "Delete"
//        ) { action, indexPath in
//            // handle action by updating model with deletion
//            do {
//                try self.realm.write {
//                    if let categoryForDeletion = self.categories?[indexPath.row] {
//                        self.realm.delete(categoryForDeletion)
//                    }
//                }
//            } catch {
//                print("Error with deleting \(error)")
//            }
//        }
//
//        // customize the action appearance
//        deleteAction.image = UIImage(systemName: "trash")
//
//        return [deleteAction]
//    }
//
//    func tableView(
//        _ tableView: UITableView,
//        editActionsOptionsForRowAt indexPath: IndexPath,
//        for orientation: SwipeActionsOrientation
//    ) -> SwipeOptions {
//        var options = SwipeOptions()
//        options.expansionStyle = .destructive
//        return options
//    }
//}
