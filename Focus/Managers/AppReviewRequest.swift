//
//  AppReviewRequest.swift
//  Focus
//
//  Created by Nikita Pishchugin on 13.06.2022.
//

import SwiftUI
import StoreKit

enum AppReviewRequest {
    
    // MARK: - Properties
    static var threshhold = 2
    @AppStorage("runsSinceLastRequest") static var runsSinceLastRequest = 0
    @AppStorage("version") static var version = ""
    
    // MARK: - Functions
    static func requestReviewIfNeeded() {
        runsSinceLastRequest += 1
        guard let appBuild = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String else {
            return
        }
        guard let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            return
        }
        let thisVersion = "\(appVersion) build: \(appBuild)"
       
        if thisVersion != version {
            if runsSinceLastRequest >= threshhold {
                if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                    version = thisVersion
                    runsSinceLastRequest = 0
                }
            }
        } else {
            runsSinceLastRequest = 0
        }
        
    }
}
