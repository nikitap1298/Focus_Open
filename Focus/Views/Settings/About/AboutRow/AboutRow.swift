//
//  AboutRow.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct AboutRow: View {
    
    // MARK: - Properties
    private var rowData: AboutRowModel
    
    init(_ rowData: AboutRowModel) {
        self.rowData = rowData
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(rowData.title)
            Spacer()
            Text(rowData.description ?? "")
                .font(.callout)
                .fontWeight(.light)
        }
//        .foregroundStyle(CustomColor.blackAndWhite)
    }
}

#Preview {
    AboutRow(AboutRowModel(id: 0,
                               title: "Developer",
                               description: "Nikita Pishchugin"))
}
