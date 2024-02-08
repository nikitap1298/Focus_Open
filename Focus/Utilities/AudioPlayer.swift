//
//  AudioPlayer.swift
//  Focus
//
//  Created by Nikita Pishchugin on 06.05.2022.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?
var timer = Timer()

func playSound(sound: String, type: String) {
    if let melody = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: melody))
            
            audioPlayer?.volume = 0.0
            timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
                if audioPlayer?.volume ?? 1.1 <= 1.01 {
                    audioPlayer?.volume += 0.05
                } else if audioPlayer?.volume ?? 1.01 > 0.99 {
                    timer.invalidate()
                }
            }
            
            // Infinite sound loop
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file")
        }
    }
}
