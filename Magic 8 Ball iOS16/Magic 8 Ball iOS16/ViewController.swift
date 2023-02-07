//
//  ViewController.swift
//  Magic 8 Ball iOS16
//
//  Created by Amr Mohamad on 07/02/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let balls = ["ball1","ball2","ball3","ball4","ball5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askButton(_ sender: UIButton) {
        imageView.image = UIImage(named: balls[Int.random(in: 0...4)])
    }
    
}

