//
//  Settings-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct Settings_View: View {
    
    // MARK: - Properties
    @Environment(\.openURL) var openURL
    
    @Binding var path: NavigationPath
    
    init(_ path: Binding<NavigationPath>) {
        _path = path
    }
    
    private var emailHelper = EmailHelper(toAddress: "wishlist@hellowewish.com",
                                          subject: "Report a Bug (Focus)",
                                          messageHeader: "Please describe your issue below")
    
    // MARK: - Body
    var body: some View {
        VStack {
            List {
                Group {
                    Section {
                        Button {
                            path.append(MainNavigationRoutes.calendar)
                        } label: {
                            SettingsRow(SettingsRowModel.data[0])
                        }
                    }
                    Section {
                        NavigationLink {
                            Appearance_View()
                        } label: {
                            SettingsRow(SettingsRowModel.data[1])
                        }
                    }
                    Section {
                        Button {
                            let appID = 1628829143
                            let reviewURL = "itms-apps://itunes.apple.com/app/id\(appID)?action=write-review"
                            
                            if let url = URL(string: reviewURL) {
                                if UIApplication.shared.canOpenURL(url) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                }
                            }
                        } label: {
                            SettingsRow(SettingsRowModel.data[2])
                        }
                        NavigationLink {
                            ShareApp_View()
                        } label: {
                            SettingsRow(SettingsRowModel.data[3])
                        }
                        Button {
                            emailHelper.send(openURL: openURL)
                        } label: {
                            SettingsRow(SettingsRowModel.data[4])
                        }
                    }
                    Section {
                        NavigationLink {
                            About_View()
                        } label: {
                            SettingsRow(SettingsRowModel.data[5])
                        }
                    }
                }
                .listRowBackground(CustomColors.whiteAndSystemGray5)
                .frame(height: 25)
            }
            .environment(\.defaultMinListRowHeight, 10)
            .scrollContentBackground(.hidden)
            .listStyle(.sidebar)
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .background(
            Color(uiColor: .systemGray6)
        )
    }
}

//#Preview {
//    Settings_View()
//}
