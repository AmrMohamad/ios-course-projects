//
//  CategoryViewController.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 15/08/2023.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController{
    
    var categories = [Category]()
    let context    = (
        UIApplication
            .shared
            .delegate as! AppDelegate
    ).persistentContainer
        .viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BigTitleNavigationBar(title: "Todoey")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addCategoryButtonPressed)
        )
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
    }
    
    //MARK: - DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = "test Category"
        return cell
    }
    
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
                let newCategroy = Category(context: self.context)
                newCategroy.name = textFieldAlert.text!
                self.categories.append(newCategroy)
                self.tableView.reloadData()
            }
        alert.addTextField { textField in
            textField.placeholder = "Name the new category"
            textFieldAlert = textField
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}
