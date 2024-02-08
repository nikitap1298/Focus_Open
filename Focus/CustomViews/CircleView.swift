//
//  CircleView.swift
//  Focus
//
//  Created by Nikita Pishchugin on 15.04.2022.
//

import SwiftUI

struct CircleView: View {
    
    // MARK: - Properties
    @State var circleColor: Color
    @State var circleOpacity: Double
    @State private var isAnimating: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .stroke(circleColor.opacity(circleOpacity), lineWidth: 40)
                .frame(width: 220, height: 220, alignment: .center)
            Circle()
                .stroke(circleColor.opacity(circleOpacity), lineWidth: 80)
                .frame(width: 220, height: 220, alignment: .center)
        } 
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 0.8), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

// MARK: - Preview
struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            CustomColors.lightBlue
                .ignoresSafeArea(.all, edges: .all)
            CircleView(circleColor: .white, circleOpacity: 0.2)
        }
    }
}
