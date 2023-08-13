//
//  SwipeTableViewController.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 17/08/2023.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    var identifierOfCell: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(
                withIdentifier: identifierOfCell ?? "Cell"
            ) as! SwipeTableViewCell
        cell.delegate = self
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        editActionsForRowAt indexPath: IndexPath,
        for orientation: SwipeActionsOrientation
    ) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(
            style: .destructive, title: "Delete"
        ) { action, indexPath in
            // handle action by updating model with deletion
            self.updateModel(at: indexPath)
        }

        // customize the action appearance
        deleteAction.image = UIImage(systemName: "trash")

        return [deleteAction]
    }
    
    func tableView(
        _ tableView: UITableView,
        editActionsOptionsForRowAt indexPath: IndexPath,
        for orientation: SwipeActionsOrientation
    ) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        
        return options
    }

    func updateModel(at indexPath: IndexPath){
        
    }
}
