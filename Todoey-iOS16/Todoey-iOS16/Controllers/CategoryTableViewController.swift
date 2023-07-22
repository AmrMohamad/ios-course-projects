//
//  CategoryTableViewController.swift
//  Todoey-iOS16
//
//  Created by Amr Mohamad on 17/07/2023.
//

import UIKit
import RealmSwift

class CategoryTableViewController: UITableViewController {

    let realm = try! Realm()
    var categories = [Category]()
//    let context = (
//        UIApplication
//        .shared
//        .delegate as! AppDelegate
//    ).persistentContainer
//        .viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadCategories()
        
    }

    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryOfItems", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
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
                self.categories.append(newCategory)
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
            
            destinationVC.selectedCategory = categories[indexPath.row]
            
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
    
//    func loadCategories(){
//        let request : NSFetchRequest<CategoryList> = CategoryList.fetchRequest()
//        do {
//            categories = try context.fetch(request)
//        } catch {
//            print("Error loading Data \(error)")
//        }
//        tableView.reloadData()
//    }
}
