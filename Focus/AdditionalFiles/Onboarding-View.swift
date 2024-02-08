//
//  Onboarding-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct Onboarding_View: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = ViewModel()
    @ObservedObject private var showOnboardingView: ShowOnboardingView
    
    init(showOnboardingView: ShowOnboardingView) {
        self.showOnboardingView = showOnboardingView
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "AccentColor")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(named: "AccentColor")?.withAlphaComponent(0.2)
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea(.all)
            VStack {
                if viewModel.isGetStarted {
                    Spacer()
                    Image("FocusIconSVG")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 125)
                        .cornerRadius(CGFloat(125).getAppIconCornerRadious())
                        .padding(.bottom, 40)
                    Text("Welcome to Focus!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    BottomActionButton({
                        Feedback().impactOccured()
                        viewModel.setIsGetStarted(false)
                    }, buttonText: "Get Started",
                                       buttonColor: Color.accentColor)
                } else {
                    TabView(){
                        ForEach(viewModel.rowData, id: \.id) { data in
                            OnboardingRow(showOnboardingView: showOnboardingView,
                                          data.imageName,
                                          data.title,
                                          data.description,
                                          data.id,
                                          viewModel.rowData.count)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                }
            }
        }
    }
}

//#Preview {
//    Onboarding_View()
//}
