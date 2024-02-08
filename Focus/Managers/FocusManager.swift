//
//  FocusManager.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

@MainActor class FocusManager: ObservableObject, TaskEntityProtocol {
    @Published private(set) var focusWorking = false
    @Published private(set) var resetTimer = false
    
    @Published private(set) var remainingTime = 1800
    @Published private(set) var longPress = false
    @Published private var timerForButton: Timer?
    @Published private(set) var showButtons = true
    @Published private(set) var labelImageName = ""
    @Published private(set) var labelText = ""
    @Published private(set) var labelOpacity = 0.0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let maxTime = 10800 - 300
    
    
    func setFocusWorking(_ value: Bool, _ coreDataModel: CoreDataModel) {
        focusWorking = value
        
        if !value {
            resetTimer = true
        } else {
            Task {
                await createTask(coreDataModel: coreDataModel, initialTime: remainingTime)
            }
        }
    }
    
    func setResetTimer(_ value: Bool) {
        resetTimer = value
    }
    
    // MARK: - Minus Button Logic
    func handleMinusButtonClick() {
        if longPress == true && remainingTime > 300 {
            
            // This tap was caused by the end of a longpress gesture, to stop our fastforwarding
            longPress.toggle()
            timerForButton?.invalidate()
        } else if longPress == false && remainingTime > 300 {
            
            // Just a regular tap
            Feedback().impactOccured()
            remainingTime -= 300
        }
        labelOpacity = 0
    }
    
    func handleMinusButtonLongClick() {
        longPress = true
        
        // Fastforward has started to start the counterForButton
        timerForButton = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: { _ in
            Task {
                await self.longMinusPress()
            }
        })
    }
    
    private func longMinusPress() async {
        if remainingTime > 300 {
            Feedback().impactOccured()
            remainingTime -= 300
        } else {
            timerForButton?.invalidate()
        }
    }
    
    // MARK: - Plus Button Logic
    func handlePlusButtonClick() {
        if longPress == true && remainingTime <= maxTime {
            
            // This tap was caused by the end of a longpress gesture, to stop our fastforwarding
            longPress.toggle()
            timerForButton?.invalidate()
        } else if longPress == false && remainingTime <= maxTime {
            
            // Just a regular tap
            Feedback().impactOccured()
            remainingTime += 300
        }
        labelOpacity = 0
    }
    
    func handlePlusButtonLongClick() {
        longPress = true
        
        //Fastforward has started to start the counterForButton
        timerForButton = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true, block: { _ in
            Task {
                await self.longPlusPress()
            }
        })
    }
    
    private func longPlusPress() async {
        if remainingTime <= maxTime {
            Feedback().impactOccured()
            remainingTime += 300
        } else {
            timerForButton?.invalidate()
        }
    }
    
    // MARK: - Timer Text
    func handleOnReceive(focusWorking: Bool, resetTimer: Bool, coreDataModel: CoreDataModel) {
        if remainingTime > 0 && focusWorking {
            remainingTime -= 1
            showButtons = false
            setLabel(.working)
        } else if remainingTime == 0 {
            Task {
                await updateRemainingTimeAndIsFinished(coreDataModel: coreDataModel,
                                                       remainingTime: remainingTime)
            }
            self.focusWorking = false
            showButtons = true
            setLabel(.finished)
        }
        if resetTimer {
            let rTime = remainingTime
            Task {
                await updateRemainingTimeAndIsFinished(coreDataModel: coreDataModel,
                                                       remainingTime: rTime)
            }
            remainingTime = 1800
            showButtons = true
            setLabel(.stop)
        }
    }
    
    // MARK: - Label
    func setLabel(_ state: TimerLabelTextEnum) {
        switch state {
        case .working:
            labelText = state.rawValue
            labelImageName = ""
            labelOpacity = 0
        case .finished:
            labelText = state.rawValue
            labelImageName = "hand.thumbsup.fill"
            labelOpacity = 1
        case .stop:
            labelText = state.rawValue
            labelImageName = "hand.thumbsdown.fill"
            labelOpacity = 1
        case .quitApp:
            labelText = state.rawValue
            labelImageName = "hand.thumbsdown.fill"
            labelOpacity = 1
        }
    }
}
