//
//  GroupBox-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct GroupBox_View: View {
    
    private var groupBoxModel: GroupBoxModel
    
    init(_ groupBoxModel: GroupBoxModel) {
        self.groupBoxModel = groupBoxModel
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            GroupBox(label: Label(groupBoxModel.labelText, systemImage: "building.columns"), content: {
                ScrollView(.vertical) {
                    Text(groupBoxModel.mainText)
                        .font(.footnote)
                }
            })
            .groupBoxStyle(CustomGroupBoxStyle())
            .padding(.vertical)
        }
        .navigationTitle(groupBoxModel.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    GroupBox_View(GroupBoxModel(id: 0,
                                 labelText: "Terms of Use",
                                 mainText: Agreements.uiDeviceComplete,
                                 navigationTitle: "Terms of Use"))
}
