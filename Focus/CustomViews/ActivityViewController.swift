//
//  ActivityViewController.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    var activityItems: [Any]
    var appicationActivities: [UIActivity]?

    func makeUIViewController(context _: Context) -> some UIViewController {
        let viewController = UIActivityViewController(activityItems: activityItems,
                                                      applicationActivities: appicationActivities)
        return viewController
    }

    func updateUIViewController(_: UIViewControllerType, context _: Context) {}
}
