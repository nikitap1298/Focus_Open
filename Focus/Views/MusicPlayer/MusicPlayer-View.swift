//
//  MusicPlayer-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct MusicPlayer_View: View {
    
    // MARK: - Properties
    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject private var viewModel = ViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text(viewModel.currentMelody)
            HStack(spacing: 25) {
                Button {
                    viewModel.clickPreviousMelodyButton()
                } label: {
                    Image(systemName: "chevron.left.2")
                }
                Button {
                    Feedback().impactOccured()
                    if viewModel.musicPlaying {
                        viewModel.playMusic(false)
                    } else {
                        viewModel.playMusic(true)
                    }
                } label: {
                    Image(systemName: viewModel.musicPlaying ? "stop.fill" : "play.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                }
                Button {
                    viewModel.clickNextMelodyButton()
                } label: {
                    Image(systemName: "chevron.right.2")
                }
            }
            .foregroundStyle(CustomColors.grayAndWhite)
            .padding()
            .onAppear {
                guard let audioPlayer = audioPlayer else { return }
                viewModel.setMusicPlaying(audioPlayer.isPlaying)
            }
        }
    }
}

//#Preview {
//    MusicPlayer_View()
//}
