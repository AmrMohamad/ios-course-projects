//
//  ViewController.swift
//  EggTimer-iOS16
//
//  Created by Amr Mohamad on 28/02/2023.
//

import UIKit

class ViewController: UIViewController {
    let softTime = 5
    let medTime = 7
    let hardTime = 12

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        print(sender.currentTitle!)
        if sender.currentTitle! == "Soft"{
            print(softTime)
        } else if sender.currentTitle! == "Medium"{
            print(medTime)
        } else{
            print(hardTime)
        }
    }
    
}

