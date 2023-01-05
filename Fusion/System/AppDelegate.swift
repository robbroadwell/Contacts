//
//  AppDelegate.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import UIKit
import Combine

typealias NotificationPayload = [AnyHashable: Any]
typealias FetchCompletion = (UIBackgroundFetchResult) -> Void

final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var systemEventsHandler: SystemEventsHandler? = {
        self.systemEventsHandler(UIApplication.shared)
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    private func systemEventsHandler(_ application: UIApplication) -> SystemEventsHandler? {
        return sceneDelegate(application)?.systemEventsHandler
    }
    
    private func sceneDelegate(_ application: UIApplication) -> SceneDelegate? {
        if let window = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 }).first?.windows.first {
            return window.windowScene?.delegate as? SceneDelegate
        }
        return nil
    }
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
}
