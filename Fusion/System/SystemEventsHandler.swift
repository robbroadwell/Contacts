//
//  SystemEventsHandler.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import UIKit
import Combine

protocol SystemEventsHandler {
    func sceneDidBecomeActive()
    func sceneWillResignActive()
}

struct RealSystemEventsHandler: SystemEventsHandler {
    
    let container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
     
    func sceneDidBecomeActive() {
        container.appState[\.system.isActive] = true
    }
    
    func sceneWillResignActive() {
        container.appState[\.system.isActive] = false
    }
}
