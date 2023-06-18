//
//  ViewController.swift
//  Todoey-iOS16
//
//  Created by Amr Mohamad on 18/06/2023.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Apples","Eggs","Milk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
}

