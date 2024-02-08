//
//  ContentView.swift
//  Focus
//
//  Created by Nikita Pishchugin on 04.05.2022.
//

import SwiftUI
import Foundation

@MainActor class ShowOnboardingView: ObservableObject {
    @Published private(set) var show = true
    
    func setShow(_ value: Bool) {
        show = value
    }
}

struct ContentView: View {
    
    // MARK: - Properties
    @ObservedObject var showOnboardingView = ShowOnboardingView()
    
    @AppStorage(AppStorageKeys.currentAppearanceType) private var currentAppearanceTypeAppStorage = AppearanceTypeEnum.system
    
    // MARK: - Body
    var body: some View {
        VStack {
            if showOnboardingView.show {
                Onboarding_View(showOnboardingView: showOnboardingView)
            } else {
                Focus_View()
            }
        }
        .onAppear {
            let isFirstLaunchUserDefaults = UserDefaults.standard.value(forKey: UserDefaultsKey.isFirstLaunch) as? Bool
            
            if isFirstLaunchUserDefaults == false {
                showOnboardingView.setShow(false)
            }
        }
        .preferredColorScheme(currentAppearanceTypeAppStorage == AppearanceTypeEnum.light ? .light : currentAppearanceTypeAppStorage == AppearanceTypeEnum.dark ? .dark : nil)
    }
}

// MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
