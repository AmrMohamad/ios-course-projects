//
//  ViewController.swift
//  Xylophone-iOS16
//
//  Created by Amr Mohamad on 26/02/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        if sender.isTouchInside == true {
            sender.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ){
                sender.alpha = 1.0
            }
        }
        playaudio(soundName: sender.currentTitle!)
    }
    
    func playaudio(soundName:String){
        let url = Bundle.main.url(forResource: "Sounds/\(soundName)", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.prepareToPlay()
        player.play()
    }
}

