//
//  AppMain.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import SwiftUI

@main
struct AppMain: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    
    let environment = AppEnvironment.bootstrap()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(container: environment.container))
        }
    }
}
