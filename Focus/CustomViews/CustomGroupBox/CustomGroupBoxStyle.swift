//
//  CustomGroupBoxStyle.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct CustomGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
        .padding()
        .background(CustomColors.whiteAndSystemGray5)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
