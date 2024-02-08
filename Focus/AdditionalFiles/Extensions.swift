//
//  Extensions.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

// MARK: - Animation
extension Animation {
    func `repeat`(while expression: Bool, autoreverses: Bool = true) -> Animation {
        if expression {
            return self.repeatForever(autoreverses: autoreverses)
        } else {
            return self
        }
    }
}

// MARK: - CGFloat
extension CGFloat {
    func getAppIconCornerRadious() -> CGFloat {
        return 10 / 57 * self
    }
}

// MARK: - UIApplication
extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
