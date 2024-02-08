//
//  Enums.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import Foundation

enum MainNavigationRoutes: Hashable {
    case settings
    case calendar
}

enum TimerLabelTextEnum: String {
    case working = ""
    case finished = "The task is finished"
    case stop = "The task is failed"
    case quitApp = "You have quit the app"
}

enum MelodyEnum: String {
    case melody1 = "Melody 1"
    case melody2 = "Melody 2"
    case melody3 = "Melody 3"
    case melody4 = "Melody 4"
}
