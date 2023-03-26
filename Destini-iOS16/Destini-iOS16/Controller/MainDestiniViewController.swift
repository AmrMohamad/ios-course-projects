//
//  ViewController.swift
//  Destini-iOS16
//
//  Created by Amr Mohamad on 24/03/2023.
//

import UIKit

class MainDestiniViewController: UIViewController {

    let destiniUI = DestiniUI()
    var story = StoryEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(destiniUI.background)
        view.addSubview(destiniUI.storyLabel)
        view.addSubview(destiniUI.choice2Button)
        view.addSubview(destiniUI.choice1Button)
        setUI()
        updateUI()
        configButtons()
    }
    
    @objc func selectedChoice (sender:UIButton){
        let decision = sender.currentTitle!
        story.nextEvent(user: decision)
        updateUI()
        
    }

    func configButtons (){
        destiniUI.choice1Button.addTarget(self, action: #selector(selectedChoice), for: .touchUpInside)
        destiniUI.choice2Button.addTarget(self, action: #selector(selectedChoice), for: .touchUpInside)
    }

}

extension MainDestiniViewController {
    
    func updateUI(){
        destiniUI.storyLabel.text = story.getStoryText()
        destiniUI.choice1Button.setTitle(story.getChoices()[0], for: .normal)
        destiniUI.choice2Button.setTitle(story.getChoices()[1], for: .normal)
    }
    
    
    func setUI(){
        
        let imageBGConstraints = [
            destiniUI.background.topAnchor.constraint(equalTo: view.topAnchor),
            destiniUI.background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            destiniUI.background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            destiniUI.background.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]
        
        let choice2ButtonConstraints = [
            destiniUI.choice2Button.heightAnchor.constraint(equalToConstant: 100),
            destiniUI.choice2Button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            destiniUI.choice2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            destiniUI.choice2Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12)
        ]
        
        let choice1ButtonConstraints = [
            destiniUI.choice1Button.heightAnchor.constraint(equalToConstant: 100),
            destiniUI.choice1Button.bottomAnchor.constraint(equalTo: destiniUI.choice2Button.topAnchor, constant: -10),
            destiniUI.choice1Button.trailingAnchor.constraint(equalTo: destiniUI.choice2Button.trailingAnchor),
            destiniUI.choice1Button.leadingAnchor.constraint(equalTo: destiniUI.choice2Button.leadingAnchor)
        ]
        
        let storyLabelConstraints = [
            destiniUI.storyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            destiniUI.storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            destiniUI.storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            destiniUI.storyLabel.bottomAnchor.constraint(equalTo: destiniUI.choice1Button.topAnchor, constant: -12)
        ]
        
        NSLayoutConstraint.activate(imageBGConstraints)
        NSLayoutConstraint.activate(choice2ButtonConstraints)
        NSLayoutConstraint.activate(choice1ButtonConstraints)
        NSLayoutConstraint.activate(storyLabelConstraints)
    }
    
}
