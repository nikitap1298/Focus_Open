//
//  OnboardingRow.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct OnboardingRow: View {
    
    // MARK: - Properties
    @ObservedObject private var showOnboardingView: ShowOnboardingView
    
    private var imageName: String
    private var title: String
    private var description: String
    private var index: Int
    private var rowDataCount: Int

    init(showOnboardingView: ShowOnboardingView, _ imageName: String, _ title: String, _ description: String, _ index: Int, _ rowDataCount: Int) {
        self.showOnboardingView = showOnboardingView
        self.imageName = imageName
        self.title = title
        self.description = description
        self.index = index
        self.rowDataCount = rowDataCount
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Spacer()
                Image(uiImage: UIImage(named: imageName) ?? .checkmark)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 350, maxHeight: 350)
                    .padding(.bottom, 50)
                Text(title)
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding()
                Text(description)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                
                Spacer()
                if rowDataCount - 1 == index {
                    BottomActionButton({
                        Feedback().impactOccured()
                        UserDefaults.standard.setValue(false, forKey: UserDefaultsKey.isFirstLaunch)
                        showOnboardingView.setShow(false)
                    }, buttonText: "Continue",
                                       buttonColor: .accentColor)
                    .padding(.bottom, 40)
                } else {
                    BottomActionButton({
                    }, buttonText: "",
                                       buttonColor: .clear)
                    .disabled(true)
                    .padding(.bottom, 40)
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}

//#Preview {
//    OnboardingRow("Folder",
//                  "Your best Wishlist app",
//                  "Create, manage and share your wishes",
//                  0,
//                  0)
//}
