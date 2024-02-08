//
//  About-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct About_View: View {
    
    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            VStack {
                Image("FocusIconSVG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125)
                    .cornerRadius(CGFloat(125).getAppIconCornerRadious())
                    .padding(.vertical, 40)
                Text("Focus")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                List {
                    ForEach(AboutRowData.data, id: \.self) { data in
                        if data.id <= 2 {
                            AboutRow(data)
                        } else if data.id == 3 {
                            Link("Terms of Use", destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")!)
                        } else if data.id == 4 {
                            Link("Privacy Policy", destination: URL(string: "https://www.termsfeed.com/live/1a519531-2cb7-4811-8f58-3746137b5d16")!)
                        } else {
                            NavigationLink {
                                Licenses_View()
                            } label: {
                                AboutRow(data)
                            }
                        }
                    }
                    .listRowBackground(colorScheme == .light ? .white : Color(uiColor: .systemGray5))
                    .frame(height: 25)
                }
                .scrollContentBackground(.hidden)
                .environment(\.defaultMinListRowHeight, 10)
                .scrollDisabled(true)
                .padding(.horizontal, 8)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Text in the back button becomes "Back"
            ToolbarItem(placement: .principal) {
                Text("About Focus")
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    About_View()
}
