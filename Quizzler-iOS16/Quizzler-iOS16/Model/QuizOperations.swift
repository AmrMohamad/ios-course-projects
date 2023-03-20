//
//  QuizOperations.swift
//  Quizzler-iOS16
//
//  Created by Amr Mohamad on 20/03/2023.
//

import Foundation

struct QuizOperations {
    let quizQuestions = [
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
    var score: Int = 0
    
    mutating func checkAnswer(user answer:String) -> Bool {
        if answer == quizQuestions[currentQuestionNumber].answer{
            score += 1
            return true
        }
        return false
    }
    
    func getQuestionText() -> String {
        return quizQuestions[currentQuestionNumber].questionText
    }
    
    func getProgress () -> Float{
        return Float(currentQuestionNumber + 1)/Float(quizQuestions.count)
    }
    
    mutating func nextQuestion() {
        if currentQuestionNumber+1 < quizQuestions.count {
            currentQuestionNumber += 1
        }else{
            currentQuestionNumber = 0
            score = 0
        }
    }
    
    func getScore () -> Int{
        return score
    }
}
