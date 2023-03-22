//
//  ViewController.swift
//  Quizzler-MultipleChoice-iOS16
//
//  Created by Amr Mohamad on 20/03/2023.
//

import UIKit

class MainQuizViewController: UIViewController {
    
    var quizUI = QuizUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "BGColor")
        view.addSubview(quizUI.imageBG)
        view.addSubview(quizUI.choose1Button)
        setUI()
        configureButtons()
    }
    
    @objc func tapped(){
        print("a7a")
    }
    func configureButtons(){
        quizUI.choose1Button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
}


extension MainQuizViewController{
    
    func setUI (){
        
        let imageBGConstraints = [
            quizUI.imageBG.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            quizUI.imageBG.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            quizUI.imageBG.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ]
        
        let choose1ButtonConstraints = [
            quizUI.choose1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            quizUI.choose1Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            quizUI.choose1Button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            quizUI.choose1Button.heightAnchor.constraint(equalToConstant: 80)
            
        ]
        
        NSLayoutConstraint.activate(imageBGConstraints)
        NSLayoutConstraint.activate(choose1ButtonConstraints)
    }
    
}
