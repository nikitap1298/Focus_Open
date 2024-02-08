//
//  StartStopButton-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct StartStopButton_View: View {
    
    // MARK: - Properties
    @EnvironmentObject private var coreDataModel: CoreDataModel
    @EnvironmentObject private var focusManager: FocusManager
    
    // MARK: - Body
    var body: some View {
        HStack {
            Button {
                Feedback().impactOccured()
                if focusManager.focusWorking {
                    focusManager.setFocusWorking(false, coreDataModel)
                } else {
                    focusManager.setFocusWorking(true, coreDataModel)
                }
            } label: {
                Text(focusManager.focusWorking ? "Stop" : "Start")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(CustomColors.whiteAndGray)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
        .background(Color.white.opacity(0.3))
        .cornerRadius(100)
        .padding(.bottom, 15)
    }
}

#Preview {
    StartStopButton_View()
}
