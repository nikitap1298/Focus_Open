//
//  Focus_ViewModel.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

extension Focus_View {
    @MainActor class ViewModel: ObservableObject {
        @Published private var _showSettingsView = false
        @Published private var _showMusicPlayerView = false
        
        var showSettingsView: Binding<Bool> {
            Binding {
                self._showSettingsView
            } set: { newValue in
                self._showSettingsView = newValue
            }
        }
        
        var showMusicPlayerView: Binding<Bool> {
            Binding {
                self._showMusicPlayerView
            } set: { newValue in
                self._showMusicPlayerView = newValue
            }
        }
        
        func toggleShowSettingsView() {
            _showSettingsView.toggle()
        }
        
        func toggleShowMusicPlayerView() {
            _showMusicPlayerView.toggle()
        }
    }
}

