//
//  Structs.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import UIKit

// Implemet to the buttons like (+ Add, Delete Account)
struct Feedback {
    private let impactMed = UIImpactFeedbackGenerator(style: .medium)
    private let notificationFeedback = UINotificationFeedbackGenerator()
    
    func impactOccured() {
        impactMed.impactOccurred()
    }
    
    func notificationOccured(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        notificationFeedback.notificationOccurred(type)
    }
}
