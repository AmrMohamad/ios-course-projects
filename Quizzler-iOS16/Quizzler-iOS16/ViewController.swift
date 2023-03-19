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
        Question(
            questionText: "A slug's blood is green.",
            answer: "True"
        ),
        Question(
            questionText: "Approximately one quarter of human bones are in the feet.",
            answer: "True"
        ),
        Question(
            questionText: "The total surface area of two human lungs is approximately 70 square metres.",
            answer: "True"
        ),
        Question(
            questionText: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
            answer: "True"
        ),
        Question(
            questionText: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.",
            answer: "False"
        ),
        Question(
            questionText: "It is illegal to pee in the Ocean in Portugal.",
            answer: "True"
        ),
        Question(
            questionText: "You can lead a cow down stairs but not up stairs.",
            answer: "False"
        ),
        Question(
            questionText: "Google was originally called 'Backrub'.",
            answer: "True"
        ),
        Question(
            questionText: "Buzz Aldrin's mother's maiden name was 'Moon'.",
            answer: "True"
        ),
        Question(
            questionText: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.",
            answer: "False"
        ),
        Question(
            questionText: "No piece of square dry paper can be folded in half more than 7 times.",
            answer: "False"
        ),
        Question(
            questionText: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.",
            answer: "True"
        )
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

