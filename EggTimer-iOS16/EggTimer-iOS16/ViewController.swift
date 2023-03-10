//
//  ViewController.swift
//  EggTimer-iOS16
//
//  Created by Amr Mohamad on 28/02/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player:AVAudioPlayer!
    @IBOutlet weak var prograssOfEgg: UIProgressView!
    @IBOutlet weak var isDone: UILabel!
    let eggTimes = ["Soft": 300,"Medium":420,"Hard":720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prograssOfEgg.progress = 0.0
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        totalTime = eggTimes[sender.currentTitle!]!
        prograssOfEgg.progress = 0.0
        secondsPassed = 0
        isDone.text = sender.currentTitle!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil , repeats: true)

        
    }
    func playaudio(soundName:String){
        let url = Bundle.main.url(forResource: "\(soundName)", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.prepareToPlay()
        player.play()
    }
    
    @objc func updateTimer(){
        if secondsPassed<totalTime{
            secondsPassed += 1
            prograssOfEgg.progress = Float(secondsPassed)/Float(totalTime)
            
            print(secondsPassed)
        }else{
            timer.invalidate()
            playaudio(soundName: "alarm_sound")
            isDone.text = "Done!"
        }
    }
    
}

