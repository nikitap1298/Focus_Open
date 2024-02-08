//
//  ShareApp-ViewModel.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

extension ShareApp_View {
    @MainActor class ViewModel: ObservableObject {
        let applink = "https://apple.co/3xjhHAs"
        @Published private(set) var isCopied = false
        @Published private var _showActivityVC = false
        
        var showActivityVC: Binding<Bool> {
            Binding {
                self._showActivityVC
            } set: { newValue in
                self._showActivityVC = newValue
            }
        }
        
        func setIsCopied(_ value: Bool) {
            isCopied = value
        }
        
        func toggleShowActivityVC() {
            _showActivityVC.toggle()
        }
    }
}
