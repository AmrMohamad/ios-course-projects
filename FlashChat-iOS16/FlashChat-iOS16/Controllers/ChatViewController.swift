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
        return cell
    }
    
    
}
