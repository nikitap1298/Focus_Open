//
//  Timer-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct Timer_View: View {
    
    // MARK: - Properties
    
    // To reset the timer when user exit the application
    @Environment(\.scenePhase) private var scenePhase
    
    @EnvironmentObject private var coreDataModel: CoreDataModel
    @EnvironmentObject private var focusManager: FocusManager
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Button {
                    focusManager.handleMinusButtonClick()
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title3)
                        .foregroundStyle(CustomColors.whiteAndGray)
                        .scaleEffect(focusManager.showButtons ? 1 : 0.01)
                        .animation(.easeOut(duration: 1), value: focusManager.showButtons)
                }
                .simultaneousGesture(LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                    focusManager.handleMinusButtonLongClick()
                })
                
                Text("\(timeToString(time: focusManager.remainingTime))")
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                    .monospacedDigit()
                    .foregroundStyle(CustomColors.whiteAndGray)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 2, x: 2, y: 2)
                    .onReceive(focusManager.timer) { _ in
                        focusManager.handleOnReceive(focusWorking: focusManager.focusWorking,
                                                     resetTimer: focusManager.resetTimer,
                                                     coreDataModel: coreDataModel)
                        focusManager.setResetTimer(false)
                    }
                Button {
                    focusManager.handlePlusButtonClick()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title3)
                        .foregroundStyle(CustomColors.whiteAndGray)
                        .scaleEffect(focusManager.showButtons ? 1 : 0.01)
                        .animation(.easeOut(duration: 1), value: focusManager.showButtons)
                }
                .simultaneousGesture(LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                    focusManager.handlePlusButtonLongClick()
                })
            }
            Label {
                Text(focusManager.labelText)
                    .font(.system(size: 20))
            } icon: {
                Image(systemName: focusManager.labelImageName)
            }
            .foregroundStyle(CustomColors.whiteAndGray)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 2, x: 2, y: 2)
            .opacity(focusManager.labelOpacity)
//            .animation(.easeOut(duration: 0.3), value: viewModel.labelOpacity)
            .padding(.top, 10)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background && focusManager.focusWorking {
                focusManager.setFocusWorking(false, coreDataModel)
                focusManager.setResetTimer(true)
                focusManager.setLabel(.quitApp)
            }
        }
    }
    
    func timeToString(time: Int) -> String {
        let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

#Preview {
    Timer_View()
}
