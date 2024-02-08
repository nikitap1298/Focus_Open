//
//  Focus-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct Focus_View: View {
    
    // MARK: - Properties
    
    // To reset characterMove when user exit the application
    @Environment(\.scenePhase) private var scenePhase
    
    @EnvironmentObject private var focusManager: FocusManager
    @StateObject private var viewModel = ViewModel()
    
    @State private var path = NavigationPath()
    
    //MARK: - Body
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [CustomColors.lightBlue, CustomColors.blue]), startPoint: .topLeading, endPoint: .bottomLeading)
                    .ignoresSafeArea(.all, edges: .all)
                VStack {
                    Timer_View()
                    Spacer()
                }
                VStack {
                    ZStack {
                        CircleView(circleColor: .white, circleOpacity: 0.1)
                        Image("girl-meditation")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .offset(x: 11)
                            .offset(y: focusManager.focusWorking ? 25 : 0)
                            .animation(Animation.easeInOut(duration: 3).repeat(while: focusManager.focusWorking),
                                       value: focusManager.focusWorking)
                    }
                }
                .padding(.top, 60)
                VStack {
                    Spacer()
                    StartStopButton_View()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        path.append(MainNavigationRoutes.settings)
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(CustomColors.grayAndWhite)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.toggleShowMusicPlayerView()
                    } label: {
                        Image(systemName: "music.note.list")
                            .foregroundStyle(CustomColors.grayAndWhite)
                    }
                    .popover(isPresented: viewModel.showMusicPlayerView) {
                        MusicPlayer_View()
                            .presentationCompactAdaptation(.popover)
                            .padding()
                            .background(.ultraThinMaterial)
                    }
                }
            }
            .navigationDestination(for: MainNavigationRoutes.self) { route in
                switch route {
                case .settings:
                    Settings_View($path)
                case .calendar:
                    Calendar_View($path)
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .background {
                    audioPlayer?.stop()
                }
            }
        }
    }
}

#Preview {
    Focus_View()
}
