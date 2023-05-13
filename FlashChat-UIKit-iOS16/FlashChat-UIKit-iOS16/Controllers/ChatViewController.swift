//
//  ChatViewController.swift
//  FlashChat-UIKit-iOS16
//
//  Created by Amr Mohamad on 13/05/2023.
//

import UIKit
import FirebaseAuth


class ChatViewController: UIViewController {

    let ui = ChatUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        config()
    }
    
    @objc func logoutButtonPressed(_ sender:UIBarButtonItem){
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print(error)
        }
    }
    

}

extension ChatViewController {
    func config() {
        ui.logoutButton.target = self
        ui.logoutButton.action = #selector(logoutButtonPressed)
    }
}


extension ChatViewController {
    func setUI () {
        // background color
        view.backgroundColor = UIColor(named: "BrandPurple")
        // navgiation bar items
        title = "⚡️FlashChat"
        navigationItem.style = .navigator
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItems = [ui.logoutButton]
        
        let writingAreaContainerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .clear
            return view
        }()
        view.addSubview(writingAreaContainerView)
        let textingAreaContainerViewConstraints = [
            writingAreaContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            writingAreaContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            writingAreaContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            writingAreaContainerView.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(textingAreaContainerViewConstraints)
        
        view.addSubview(ui.writingTextField)
        view.addSubview(ui.sendButton)
        let writingTextFieldConstraints = [
            ui.writingTextField.heightAnchor.constraint(equalToConstant: 40),
            ui.writingTextField.leadingAnchor.constraint(equalTo: writingAreaContainerView.leadingAnchor, constant: 20),
            ui.writingTextField.topAnchor.constraint(equalTo: writingAreaContainerView.topAnchor, constant: 20)
        ]
        
        let sendButtonConstraints = [
            ui.sendButton.widthAnchor.constraint(equalToConstant: 40),
            ui.sendButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            ui.sendButton.trailingAnchor.constraint(equalTo: writingAreaContainerView.trailingAnchor, constant: -20),
            ui.sendButton.topAnchor.constraint(equalTo: writingAreaContainerView.topAnchor, constant: 20),
            ui.sendButton.leadingAnchor.constraint(equalTo: ui.writingTextField.trailingAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(writingTextFieldConstraints)
        NSLayoutConstraint.activate(sendButtonConstraints)
        // add the tableview
        let chatTableView: UITableView = {
            let tableView = UITableView()
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "chatCell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            return tableView
        }()
        view.addSubview(chatTableView)
        
        let chatTableViewConstraints = [
            chatTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: writingAreaContainerView.topAnchor)
        ]
        
        NSLayoutConstraint.activate(chatTableViewConstraints)
        // end adding the tableview
        
        chatTableView.dataSource = self
        chatTableView.delegate   = self
        

        
        
    }
}

extension ChatViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath)
        return cell
    }
    
    
}
