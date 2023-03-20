//
//  ViewController.swift
//  Quizzler-iOS16
//
//  Created by Amr Mohamad on 13/03/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quiz = QuizOperations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        trueButton.layer.borderWidth = CGFloat(5)
        trueButton.layer.cornerRadius = CGFloat(25)
        trueButton.layer.borderColor = UIColor.systemGray2.cgColor
        
        falseButton.layer.borderWidth = CGFloat(5)
        falseButton.layer.cornerRadius = CGFloat(25)
        falseButton.layer.borderColor = UIColor.systemGray2.cgColor
        
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
       let result =  quiz.checkAnswer(user: sender.currentTitle!)
        
        if result {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quiz.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quiz.getQuestionText()
        progressBar.progress = quiz.getProgress()
        scoreLabel.text = "Score: \(quiz.getScore())"
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
    }
}

