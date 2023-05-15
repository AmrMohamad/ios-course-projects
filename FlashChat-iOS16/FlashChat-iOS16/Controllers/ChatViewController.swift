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
    
    let messages: [Message] = [
        Message(sender: "1@2.com", body: "a7a"),
        Message(sender: "2@2.com", body: "A7Aidlkfkldsflksdflkslk"),
        Message(sender: "1@2.com", body: "Testednklvnlkasnf;lnlc fs flknhflkdlkf bsilafhsjco;i;ashun lksncnlkndiuwefujhfmdolndlkfbdhblhdasjsnfoiewhsklfhk s,mniwnfi")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = Constants.appName
        chatTableView.dataSource = self
        
        chatTableView.register(UINib(nibName: Constants.cellNibName, bundle: nil),
                               forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if let messageBody = writingMessageTextField.text,
           let messageSender = Auth.auth().currentUser?.email {
            db.collection("messages")
                .addDocument(
                    data: ["sender":messageSender,
                           "body":messageBody]
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
