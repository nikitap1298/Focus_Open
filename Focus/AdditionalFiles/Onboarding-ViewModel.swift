//
//  Onboarding-ViewModel.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

extension Onboarding_View {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var isGetStarted = true
        
        let rowData = [
            (id: 0,
             imageName: "OnboardingRowImage1",
             title: "Your simple Focus app",
             description: "Stay in Focus while you meditate or work"),
            (id: 1,
             imageName: "OnboardingRowImage2",
             title: "Relaxing melodies",
             description: "Listen to 4 melodies that are made especially for the app"),
            (id: 2,
             imageName: "OnboardingRowImage3",
             title: "Calendar",
             description: "Track your meditation time stats")
        ]
        
        func setIsGetStarted(_ value: Bool) {
            isGetStarted = value
        }
    }
}
