//
//  BottomActionButton.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct BottomActionButton: View {
    
    // MARK: - Properties
    private var action: () -> Void
    private var buttonText: String
    private var buttonColor: Color
    
    init(_ action: @escaping () -> Void,
         buttonText: String,
         buttonColor: Color) {
        self.action = action
        self.buttonText = buttonText
        self.buttonColor = buttonColor
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            Button {
                Feedback().impactOccured()
                action()
            } label: {
                Text(buttonText)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(CustomColors.whiteAndGray)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
        .background(buttonColor)
        .cornerRadius(100)
        .padding(.bottom, 15)
    }
}
