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
        view.addSubview(quizUI.progressBar)
        view.addSubview(quizUI.choose1Button)
        view.addSubview(quizUI.choose2Button)
        view.addSubview(quizUI.choose3Button)
        view.addSubview(quizUI.scoreLabel)
        view.addSubview(quizUI.questionTextLabel)
        
        setUI()
        configureButtons()
    }
    
    @objc func tapped(_ sender: UIButton){
        print(sender.currentTitle!)
    }
    func configureButtons(){
        quizUI.choose3Button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        quizUI.choose2Button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        quizUI.choose1Button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
}


extension MainQuizViewController{
    
    func setUI (){
        let heightOfChooseButton: CGFloat = 70
        let imageBGConstraints = [
            quizUI.imageBG.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            quizUI.imageBG.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            quizUI.imageBG.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ]
        
        let progressBarConstraints  = [
            quizUI.progressBar.heightAnchor.constraint(equalToConstant: 10),
            quizUI.progressBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            quizUI.progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            quizUI.progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14)
        ]
        
        let choose3ButtonConstraints = [
            quizUI.choose3Button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            quizUI.choose3Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            quizUI.choose3Button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            quizUI.choose3Button.heightAnchor.constraint(equalToConstant: heightOfChooseButton)
            
        ]
        
        let choose2ButtonConstraints = [
            quizUI.choose2Button.bottomAnchor.constraint(equalTo: quizUI.choose3Button.topAnchor, constant: -5),
            quizUI.choose2Button.trailingAnchor.constraint(equalTo: quizUI.choose3Button.trailingAnchor),
            quizUI.choose2Button.leadingAnchor.constraint(equalTo: quizUI.choose3Button.leadingAnchor),
            quizUI.choose2Button.heightAnchor.constraint(equalToConstant: heightOfChooseButton)
        ]
        
        let choose1ButtonConstraints = [
            quizUI.choose1Button.bottomAnchor.constraint(equalTo: quizUI.choose2Button.topAnchor, constant: -5),
            quizUI.choose1Button.trailingAnchor.constraint(equalTo: quizUI.choose2Button.trailingAnchor),
            quizUI.choose1Button.leadingAnchor.constraint(equalTo: quizUI.choose2Button.leadingAnchor),
            quizUI.choose1Button.heightAnchor.constraint(equalToConstant: heightOfChooseButton)
        ]
        let scoreLabelConstraints = [
            quizUI.scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            quizUI.scoreLabel.trailingAnchor.constraint(equalTo: quizUI.choose3Button.trailingAnchor),
            quizUI.scoreLabel.leadingAnchor.constraint(equalTo: quizUI.choose3Button.leadingAnchor),
            quizUI.scoreLabel.heightAnchor.constraint(equalToConstant: 65)
        ]
        
        let questionTextLabelConstraints = [
            quizUI.questionTextLabel.topAnchor.constraint(equalTo: quizUI.scoreLabel.bottomAnchor),
            quizUI.questionTextLabel.bottomAnchor.constraint(equalTo: quizUI.choose1Button.topAnchor),
            quizUI.questionTextLabel.leadingAnchor.constraint(equalTo: quizUI.scoreLabel.leadingAnchor),
            quizUI.questionTextLabel.trailingAnchor.constraint(equalTo: quizUI.scoreLabel.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(imageBGConstraints)
        NSLayoutConstraint.activate(progressBarConstraints)
        NSLayoutConstraint.activate(choose3ButtonConstraints)
        NSLayoutConstraint.activate(choose2ButtonConstraints)
        NSLayoutConstraint.activate(choose1ButtonConstraints)
        NSLayoutConstraint.activate(scoreLabelConstraints)
        NSLayoutConstraint.activate(questionTextLabelConstraints)
    }
    
}
