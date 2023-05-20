//
//  ChatViewController.swift
//  FlashChat-UIKit-iOS16
//
//  Created by Amr Mohamad on 13/05/2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class ChatViewController: UIViewController {

    let ui = ChatUI()
    let db = Firestore.firestore()
    
    let chatTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.indentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var messages: [Message] = [Message(sender: "1@2.com", body: "test")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        config()
        
        chatTableView.dataSource = self
        
        loadMessages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: Constants.BrandColors.blue)
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: .black),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.barTintColor = UIColor(named: Constants.BrandColors.blue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = appearance.backgroundColor
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor.tintColor
    }
    
    func loadMessages(){
        db.collection("messages")
            .order(by: "date")
            .addSnapshotListener { querySnapshot, error in
                self.messages = []
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    if let snapshotDoc = querySnapshot?.documents {
                        for doc in snapshotDoc {
                            let dataOfMessage = doc.data()
                            if let messageSender = dataOfMessage["sender"] as? String,
                               let messageBody   = dataOfMessage["body"] as? String {
                                let newMessage = Message(sender: messageSender,
                                                         body: messageBody)
                                self.messages.append(newMessage)
                                
                                DispatchQueue.main.async {
                                    self.chatTableView.reloadData()
                                    self.chatTableView.scrollToRow(
                                        at: IndexPath(row: self.messages.count - 1, section: 0),
                                        at: .top,
                                        animated: true)
                                }
                            }
                        }
                    }
                }
            }
    }
    
    @objc func sendButtonPressed(_ sender:UIButton) {
        if let messageSender = Auth.auth().currentUser?.email,
           let messageBody   = ui.writingTextField.text {
            db.collection("messages")
                .addDocument(
                    data: [
                        "sender": messageSender,
                        "body"  : messageBody,
                        "date"  : Date().timeIntervalSince1970
                    ]
                ) { error in
                    if let e = error {
                        print(e.localizedDescription)
                    }
                    else {
                        print("send data successfully")
                        DispatchQueue.main.async {
                            self.ui.writingTextField.text = ""
                        }
                    }
                }
        }
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
        
        ui.sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
    }
}


extension ChatViewController {
    func setUI () {
        // background color
        view.backgroundColor = UIColor(named: Constants.BrandColors.purple)
        // navgiation bar items
        title = Constants.appName
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
            ui.writingTextField.topAnchor.constraint(equalTo: writingAreaContainerView.topAnchor, constant: 15),
            ui.writingTextField.bottomAnchor.constraint(equalTo: writingAreaContainerView.bottomAnchor, constant: -5)
        ]
        
        let sendButtonConstraints = [
            ui.sendButton.widthAnchor.constraint(equalToConstant: 40),
            ui.sendButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            ui.sendButton.trailingAnchor.constraint(equalTo: writingAreaContainerView.trailingAnchor, constant: -20),
            ui.sendButton.topAnchor.constraint(equalTo: writingAreaContainerView.topAnchor, constant: 15),
            ui.sendButton.leadingAnchor.constraint(equalTo: ui.writingTextField.trailingAnchor, constant: 20),
            ui.sendButton.bottomAnchor.constraint(equalTo: writingAreaContainerView.bottomAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(writingTextFieldConstraints)
        NSLayoutConstraint.activate(sendButtonConstraints)
        // add the tableview
        view.addSubview(chatTableView)
        
        let chatTableViewConstraints = [
            chatTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: writingAreaContainerView.topAnchor)
        ]
        
        NSLayoutConstraint.activate(chatTableViewConstraints)
        // end adding the tableview
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.indentifier, for: indexPath) as! MessageTableViewCell
        cell.messageLabel.text = messages[indexPath.row].body
        cell.selectionStyle = .none
        let message = messages[indexPath.row]
        if message.sender == Auth.auth().currentUser?.email {
            
            cell.avaterImage.isHidden = false
            cell.avaterSecondImage.isHidden = true
            cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.purple)
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            
        }
        else {
            
            cell.avaterImage.isHidden = true
            cell.avaterSecondImage.isHidden = false
            cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.purple)
            
        }
        return cell
    }
    
    
}
