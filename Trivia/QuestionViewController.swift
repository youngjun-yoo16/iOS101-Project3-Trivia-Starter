//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Youngjun Yoo on 3/11/24.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var questionDescriptionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    private var questions = [TriviaQuestion]()
    private var selectedQuestionIndex = 0
    private var prevIndex = 0
    private var correctAnswerNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = createMockData()
        configure(with: questions[selectedQuestionIndex])
        
        questionDescriptionLabel.numberOfLines = 0
        questionDescriptionLabel.lineBreakMode = .byWordWrapping
        
        questionDescriptionLabel.layer.cornerRadius = questionDescriptionLabel.frame.height / 30
        questionDescriptionLabel.clipsToBounds = true
        
        answer1.layer.cornerRadius = answer1.frame.height / 7.5
        answer1.clipsToBounds = true
        answer2.layer.cornerRadius = answer2.frame.height / 7.5
        answer2.clipsToBounds = true
        answer3.layer.cornerRadius = answer3.frame.height / 7.5
        answer3.clipsToBounds = true
        answer4.layer.cornerRadius = answer4.frame.height / 7.5
        answer4.clipsToBounds = true
    }
    
    @IBAction func didTapOption1(_ sender: UIButton) {
        if (questions[selectedQuestionIndex].topic.correctAnswerIdx == 0) {
            correctAnswerNum += 1
        }
        
        if (prevIndex == 2) {
            shouldAlert(with: correctAnswerNum)
            prevIndex = 0
            selectedQuestionIndex = 0
            correctAnswerNum = 0
        } else {
            selectedQuestionIndex = min(questions.count - 1, selectedQuestionIndex + 1)
            configure(with: questions[selectedQuestionIndex])
            prevIndex = selectedQuestionIndex
        }

    }
    @IBAction func didTapOption2(_ sender: UIButton) {
        if (questions[selectedQuestionIndex].topic.correctAnswerIdx == 1) {
            correctAnswerNum += 1
        }
        
        if (prevIndex == 2) {
            shouldAlert(with: correctAnswerNum)
            prevIndex = 0
            selectedQuestionIndex = 0
            correctAnswerNum = 0
        } else {
            selectedQuestionIndex = min(questions.count - 1, selectedQuestionIndex + 1)
            configure(with: questions[selectedQuestionIndex])
            prevIndex = selectedQuestionIndex
        }
    }
    @IBAction func didTapOption3(_ sender: UIButton) {
        if (questions[selectedQuestionIndex].topic.correctAnswerIdx == 2) {
            correctAnswerNum += 1
        }
        
        if (prevIndex == 2) {
            shouldAlert(with: correctAnswerNum)
            prevIndex = 0
            selectedQuestionIndex = 0
            correctAnswerNum = 0
        } else {
            selectedQuestionIndex = min(questions.count - 1, selectedQuestionIndex + 1)
            configure(with: questions[selectedQuestionIndex])
            prevIndex = selectedQuestionIndex
        }
    }
    @IBAction func didTapOption4(_ sender: UIButton) {
        if (questions[selectedQuestionIndex].topic.correctAnswerIdx == 3) {
            correctAnswerNum += 1
        }
        
        if (prevIndex == 2) {
            shouldAlert(with: correctAnswerNum)
            prevIndex = 0
            selectedQuestionIndex = 0
            correctAnswerNum = 0
        } else {
            selectedQuestionIndex = min(questions.count - 1, selectedQuestionIndex + 1)
            configure(with: questions[selectedQuestionIndex])
            prevIndex = selectedQuestionIndex
        }
    }
    
    private func createMockData() -> [TriviaQuestion] {
        let mockData1 = TriviaQuestion(questionNum: 1, topic: .videoGames)
        let mockData2 = TriviaQuestion(questionNum: 2, topic: .history)
        let mockData3 = TriviaQuestion(questionNum: 3, topic: .music)
        
        return [mockData1, mockData2, mockData3]
    }
    
    private func shouldAlert(with finalScore: Int) {
        let alert = UIAlertController(title: "Game Over!", message: "Final Score: " + String(finalScore) + "/3", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Restart", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            self.configure(with: self.questions[0])
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func configure(with question: TriviaQuestion) {
        questionLabel.text = "Question: " + String(question.questionNum) + "/3"
        topicLabel.text = question.topic.topic
        questionDescriptionLabel.text = question.topic.description
        answer1.setTitle(question.topic.answers[0], for: .normal)
        answer2.setTitle(question.topic.answers[1], for: .normal)
        answer3.setTitle(question.topic.answers[2], for: .normal)
        answer4.setTitle(question.topic.answers[3], for: .normal)
    }
}
