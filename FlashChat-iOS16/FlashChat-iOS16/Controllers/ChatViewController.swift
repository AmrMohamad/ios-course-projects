//
//  ChatViewController.swift
//  FlashChat-iOS16
//
//  Created by Amr Mohamad on 09/05/2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var writingMessageTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .black),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationController?.navigationBar.barTintColor = UIColor(named: Constants.BrandColors.blue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.tintColor = UIColor.tintColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = Constants.appName
        chatTableView.dataSource = self
        
        chatTableView.register(UINib(nibName: Constants.cellNibName, bundle: nil),
                               forCellReuseIdentifier: Constants.cellIdentifier)
        
        loadMessages()
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
                        let dataMessages = doc.data()
                        if let messageSender = dataMessages["sender"] as? String,
                           let messageBody = dataMessages["body"] as? String {
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
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if let messageBody = writingMessageTextField.text,
           let messageSender = Auth.auth().currentUser?.email {
            db.collection("messages")
                .addDocument(
                    data: ["sender":messageSender,
                           "body":messageBody,
                           "date":Date().timeIntervalSince1970]
                ) { error in
                    if let e = error {
                        print(e.localizedDescription)
                    } else {
                        print("send data successfully")
                        DispatchQueue.main.async {
                            self.writingMessageTextField.text = ""
                            
                        }
                        
                    }
                }
        }
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIBarButtonItem){
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print(error)
        }
    }

}
// MARK: - assigning data to table

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier,
                                                 for: indexPath) as! MessageTableViewCell
        cell.messageLabel.text = messages[indexPath.row].body
        let message = messages[indexPath.row]
        if message.sender == Auth.auth().currentUser?.email {
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.purple)
            cell.avaterImage.isHidden = false
            cell.avaterSecondImage.isHidden = true
        }
        else {
            cell.messageBubble.backgroundColor = UIColor(named:  Constants.BrandColors.purple)
            cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.avaterImage.isHidden = true
            cell.avaterSecondImage.isHidden = false
        }
        
        return cell
    }
    
    
}
