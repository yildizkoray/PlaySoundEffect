//
//  ViewController.swift
//  PlaySoundEffect
//
//  Created by Koray Yıldız on 12.02.2019.
//  Copyright © 2019 Koray Yıldız. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func handlePlayButton(_ sender: Any) {
        playSound()
    }
    
    fileprivate func playSound() {
        guard let url = Bundle.main.url(forResource: "resultVCSoundEffect", withExtension: "wav") else { return }
        let delay : TimeInterval = 5.0
        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let avPlayer = player else { return }
            let now : TimeInterval = avPlayer.deviceCurrentTime
            avPlayer.play(atTime: now + delay)
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

