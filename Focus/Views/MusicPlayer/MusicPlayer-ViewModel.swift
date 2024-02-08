//
//  MusicPlayer-ViewModel.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import AVFoundation
import SwiftUI

extension MusicPlayer_View {
    @MainActor class ViewModel: ObservableObject {
        @AppStorage("currentMelody") private(set) var currentMelody: String = MelodyEnum.melody1.rawValue
        @AppStorage("musicNumber") private var musicNumber = 0
        @Published private(set) var musicPlaying = false
        
        func setCurrentMelody(_ value: MelodyEnum) {
            currentMelody = value.rawValue
        }
        
        func setMusicPlaying(_ value: Bool) {
            musicPlaying = value
        }
        
        func playMusic(_ value: Bool) {
            musicPlaying = value

            playSound(sound: currentMelody, type: "mp3")
            
            if value {
                audioPlayer?.play()
            } else {
                audioPlayer?.stop()
            }
        }
        
        func clickPreviousMelodyButton() {
            Feedback().impactOccured()
            timer.invalidate()
            musicNumber -= 1
            switch musicNumber {
            case -1:
                setCurrentMelody(MelodyEnum.melody4)
                musicNumber = 3
            case 0:
                setCurrentMelody(MelodyEnum.melody1)
            case 1:
                setCurrentMelody(MelodyEnum.melody2)
            case 2:
                setCurrentMelody(MelodyEnum.melody3)
            default:
                break
            }
            
            if musicPlaying {
                playSound(sound: currentMelody, type: "mp3")
            }
        }
        
        func clickNextMelodyButton() {
            Feedback().impactOccured()
            timer.invalidate()
            musicNumber += 1
            switch musicNumber {
            case 0:
                setCurrentMelody(MelodyEnum.melody1)
            case 1:
                setCurrentMelody(MelodyEnum.melody2)
            case 2:
                setCurrentMelody(MelodyEnum.melody3)
            case 3:
                setCurrentMelody(MelodyEnum.melody4)
            case 4:
                setCurrentMelody(MelodyEnum.melody1)
                musicNumber = 0
            default:
                break
            }
            
            if musicPlaying {
                playSound(sound: currentMelody, type: "mp3")
            }
        }
    }
}
