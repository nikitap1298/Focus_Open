//
//  Licenses-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct Licenses_View: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea(.all)
            List {
                Section {
                    ForEach(LicensesRowData.data, id: \.self) { data in
                        NavigationLink {
                            if data.id == 0 {
                                GroupBox_View(GroupBoxModel(id: data.id,
                                                           labelText: "License",
                                                           mainText: Agreements.uiDeviceComplete,
                                                           navigationTitle: data.title))
                            } else if data.id == 1 {
                                GroupBox_View(GroupBoxModel(id: data.id,
                                                           labelText: "License",
                                                           mainText: Agreements.icons8,
                                                           navigationTitle: data.title))
                            }
                        } label: {
                            AboutRow(data)
                        }
                    }
                    .listRowBackground(CustomColors.whiteAndSystemGray5)
                    .frame(height: 25)
                } footer: {
                    HStack {
                        Spacer()
                        Text("Thanks to all those amazing people 💚")
                        Spacer()
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .environment(\.defaultMinListRowHeight, 10)
            .padding(.horizontal, 8)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Licenses")
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    Licenses_View()
}
