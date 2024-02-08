//
//  Settings-Model.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct SettingsRowDataModel {
    let id: Int
    let uiImageName: String?
    let imageName: String
    let imageBackgroundColor: Color?
    let text: String
}


struct SettingsRowModel {
    static var data = [
        SettingsRowDataModel(id: 1,
                             uiImageName: nil,
                             imageName: "calendar",
                             imageBackgroundColor: .green,
                             text: "Calendar"),
        SettingsRowDataModel(id: 1,
                             uiImageName: nil,
                             imageName: "circle.lefthalf.filled.inverse",
                             imageBackgroundColor: .blue,
                             text: "Appearance"),
        SettingsRowDataModel(id: 2,
                             uiImageName: nil,
                             imageName: "star.fill",
                             imageBackgroundColor: .yellow,
                             text: "Rate App"),
        SettingsRowDataModel(id: 3,
                             uiImageName: nil,
                             imageName: "square.and.arrow.up.fill",
                             imageBackgroundColor: .green,
                             text: "Share App"),
        SettingsRowDataModel(id: 4,
                             uiImageName: nil,
                             imageName: "exclamationmark.triangle.fill",
                             imageBackgroundColor: .red,
                             text: "Report a Bug"),
        SettingsRowDataModel(id: 5,
                             uiImageName: "AppIcon",
                             imageName: "",
                             imageBackgroundColor: .gray,
                             text: "About Focus"),
    ]
}
