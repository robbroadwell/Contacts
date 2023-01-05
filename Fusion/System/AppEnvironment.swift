//
//  AppEnvironment.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import UIKit
import Combine

struct AppEnvironment {
    let container: DIContainer
    let systemEventsHandler: SystemEventsHandler
}

extension AppEnvironment {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    
    static func bootstrap() -> AppEnvironment {
        let appState = Store<AppState>(AppState())
        let session = configuredURLSession()
        let services = configuredServices(appState: appState, session: session)
        
        let diContainer = DIContainer(appState: appState, services: services)
        let systemEventsHandler = RealSystemEventsHandler(container: diContainer)
        
        return AppEnvironment(container: diContainer, systemEventsHandler: systemEventsHandler)
    }
        
    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
    
    private static func configuredServices(appState: Store<AppState>, session: URLSession) -> DIContainer.Services {
        let usersService = RealUsersService(
            session: session,
            baseURL: baseURL)
        
        return .init(usersService: usersService)
    }
}
