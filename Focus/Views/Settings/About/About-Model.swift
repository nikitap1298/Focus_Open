//
//  About-Model.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct AboutRowModel: Hashable {
    let id: Int
    let title: String
    let description: String?
}

struct AboutRowData {
    static var data = [
        AboutRowModel(id: 0,
                      title: "Developer",
                      description: "Nikita Pishchugin"),
        AboutRowModel(id: 1,
                      title: "Sound",
                      description: "Paul Burak"),
        AboutRowModel(id: 2,
                      title: "Version",
                      description: UIApplication.appVersion),
        AboutRowModel(id: 3,
                      title: "Terms of Use",
                      description: nil),
        AboutRowModel(id: 4,
                      title: "Privacy Policy",
                      description: nil),
        AboutRowModel(id: 5,
                      title: "Licenses",
                      description: nil)
    ]
}

struct GroupBoxModel {
    let id: Int
    let labelText: String
    let mainText: String
    let navigationTitle: String
}

struct LicensesRowData {
    static var data = [
        AboutRowModel(id: 0,
                      title: "UIDeviceComplete",
                      description: nil),
        AboutRowModel(id: 1,
                      title: "icons8",
                      description: nil)
        ]
}

