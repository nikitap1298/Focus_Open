//
//  Focus.swift
//  Focus
//
//  Created by Nikita Pishchugin on 14.04.2022.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // Override point for customization after application launch.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        //Turn off auto-lock
        UIApplication.shared.isIdleTimerDisabled = true
        return true
    }
    
    // Called when the application is about to terminate. Save data if appropriate.
    func applicationWillTerminate(_ application: UIApplication) {
        //Turn on auto-lock after close the App
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self // 👈🏻
        return sceneConfig
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
   // var window: UIWindow?

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        UIApplication.shared.isIdleTimerDisabled = true
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        UIApplication.shared.isIdleTimerDisabled = false
    }
}

@main
struct FocusApp: App {
    
    @UIApplicationDelegateAdaptor (AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CoreDataModel())
                .environmentObject(FocusManager())
        }
    }
}
