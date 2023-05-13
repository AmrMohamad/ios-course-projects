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
        print("=========>a7a")
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
        ui.logoutButton.style = .plain
        ui.logoutButton.action = #selector(logoutButtonPressed)
    }
}


extension ChatViewController {
    func setUI () {
        view.backgroundColor = UIColor(named: "BrandPurple")
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItems = [ui.logoutButton]
    }
}
