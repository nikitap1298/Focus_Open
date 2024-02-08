//
//  Appearance-ViewModel.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

extension Appearance_View {
    @MainActor class ViewModel: ObservableObject {
        @AppStorage(AppStorageKeys.currentAppearanceType) private(set) var currentAppearanceTypeAppStorage = AppearanceTypeEnum.system
        @Published private(set) var currentAppearanceType = AppearanceTypeEnum.system
        
        func setCurrentAppearanceType(_ type: AppearanceTypeEnum) {
            Feedback().impactOccured()
            currentAppearanceType = type
            
            currentAppearanceTypeAppStorage = type
        }
        
        func setCurrentAppearanceTypeFromUserDefaults() {
            currentAppearanceType = currentAppearanceTypeAppStorage
        }
    }
}
