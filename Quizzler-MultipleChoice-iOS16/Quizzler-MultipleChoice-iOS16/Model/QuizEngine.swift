//
//  QuizEngine.swift
//  Quizzler-MultipleChoice-iOS16
//
//  Created by Amr Mohamad on 23/03/2023.
//

import Foundation

struct QuizEngine {
    let quizQuestions = [
        Question(questionText: "Which is the largest organ in the human body?",
                 answer: ["Heart", "Skin", "Large Intestine"],
                 correctAnswer: "Skin"),
        Question(questionText: "Five dollars is worth how many nickels?",
                 answer: ["25", "50", "100"],
                 correctAnswer: "100"),
        Question(questionText: "What do the letters in the GMT time zone stand for?",
                 answer: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"],
                 correctAnswer: "Greenwich Mean Time"),
        Question(questionText: "What is the French word for 'hat'?",
                 answer: ["Chapeau", "Écharpe", "Bonnet"],
                 correctAnswer: "Chapeau"),
        Question(questionText: "In past times, what would a gentleman keep in his fob pocket?",
                 answer: ["Notebook", "Handkerchief", "Watch"],
                 correctAnswer: "Watch"),
        Question(questionText: "How would one say goodbye in Spanish?",
                 answer: ["Au Revoir", "Adiós", "Salir"],
                 correctAnswer: "Adiós"),
        Question(questionText: "Which of these colours is NOT featured in the logo for Google?",
                 answer: ["Green", "Orange", "Blue"],
                 correctAnswer: "Orange"),
        Question(questionText: "What alcoholic drink is made from molasses?",
                 answer: ["Rum", "Whisky", "Gin"],
                 correctAnswer: "Rum"),
        Question(questionText: "What type of animal was Harambe?",
                 answer: ["Panda", "Gorilla", "Crocodile"],
                 correctAnswer: "Gorilla"),
        Question(questionText: "Where is Tasmania located?",
                 answer: ["Indonesia", "Australia", "Scotland"],
                 correctAnswer: "Australia")
    ]
    
    var currentQuestionNumber: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(user answer:String) -> Bool {
        if answer == quizQuestions[currentQuestionNumber].correctAnswer{
            score += 1
            return true
        }
        return false
    }
    
    func getQuestionText() -> String {
        return quizQuestions[currentQuestionNumber].questionText
    }
    
    func getChoices ( ) -> [String]{
        return quizQuestions[currentQuestionNumber].answer
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
