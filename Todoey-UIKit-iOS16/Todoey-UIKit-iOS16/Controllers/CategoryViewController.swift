//
//  CategoryViewController.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 15/08/2023.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController{
    
    var categories: Results<Category>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BigTitleNavigationBar(title: "Todoey")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addCategoryButtonPressed)
        )

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")

        loadCategories()
    }
    
    //MARK: - DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return categories?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
       
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category added yet"
        return cell
    }
    
    //MARK: - Add New Cetegories
    
    @objc func addCategoryButtonPressed(_ sender: UIBarButtonItem){
        let alert = UIAlertController(
            title: "Add New Category",
            message: nil,
            preferredStyle: .alert
        )
        var textFieldAlert = UITextField()
        let action = UIAlertAction(
            title: "Add Category",
            style: .default) { action in
                let newCategroy = Category()
                newCategroy.name = textFieldAlert.text!

                self.save(category: newCategroy)
            }
        alert.addTextField { textField in
            textField.placeholder = "Name the new category"
            textFieldAlert = textField
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //MARK: - TabView Delegate Methods
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let todoVC = TodoListViewController()
//        todoVC.selectedCategory = categories[indexPath.row]
//        self.navigationController?.pushViewController(todoVC, animated: true)
//
//    }
//
    //MARK: - Data Operations Methods
    
    func save(category: Object){
        do{
            try realm.write({
                realm.add(category)
            })
        } catch {
            print("Error Saving Data \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories (){
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }
}
