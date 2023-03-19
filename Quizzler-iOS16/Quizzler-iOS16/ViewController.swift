//
//  ViewController.swift
//  Quizzler-iOS16
//
//  Created by Amr Mohamad on 13/03/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

    let quiz = [
        Question(questionText: "4 + 2 = 6 ?", answer: "True"),
        Question(questionText: "Five - Three is greater than one", answer: "True"),
        Question(questionText: "3 + Eight is < 10", answer: "False")
    ]
    
    var currentQuestionNumber: Int = 0
    var progressPercentage: Float = 0.0
    
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
        let userAnswer = sender.currentTitle!
        let rightAnswer = quiz[currentQuestionNumber].answer
        
        if userAnswer == rightAnswer {
            currentQuestionNumber += 1
            progressPercentage = Float(currentQuestionNumber)/Float(quiz.count)
            updateUI()
        }
        
    }
    
    func updateUI(){
        if currentQuestionNumber < quiz.count{
            questionLabel.text = quiz[currentQuestionNumber].questionText
            progressBar.progress = progressPercentage
        }else{
            currentQuestionNumber = 0
            progressPercentage = 0.0
            questionLabel.text = quiz[currentQuestionNumber].questionText
            progressBar.progress = progressPercentage
        }
        
    }
}

