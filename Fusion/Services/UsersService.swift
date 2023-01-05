//
//  UsersService.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import Combine
import Foundation

protocol UsersService: WebService {
    func load(users: LoadableSubject<[User]>)
}

struct RealUsersService: UsersService {
    
    let session: URLSession
    let baseURL: String
    let bgQueue = DispatchQueue(label: "bg_parse_queue")
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func load(users: LoadableSubject<[User]>) {
                 
        let cancelBag = CancelBag()
        users.wrappedValue.setIsLoading(cancelBag: cancelBag)

        call(endpoint: API.users)
            .sinkToLoadable { users.wrappedValue = $0 }
            .store(in: cancelBag)
        
    }
}

// MARK: - API

extension RealUsersService {
    enum API {
        case users
    }
}

extension RealUsersService.API: APICall {
    var path: String {
        switch self {
        case .users:
            return "/users"
        }
    }
    var method: String {
        switch self {
        case .users:
            return "GET"
        }
    }
    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
    func body() throws -> Data? {
        return nil
    }
}

// MARK: - Stub

struct StubUsersService: UsersService {
    var session: URLSession = stubSession
    var baseURL: String
    var bgQueue: DispatchQueue
    
    init() {
        self.baseURL = ""
        self.bgQueue = DispatchQueue.global(qos: .background)
    }
    
    private static var stubSession: URLSession {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }
    
    private var stubLoadingDelay: DispatchTime {
        .now() + 1.0
    }
    
    private var stubNetworkRequest: AnyPublisher<[User], Error> {
        Just(User.mockedData)
            .setFailureType(to: Error.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func load(users: LoadableSubject<[User]>) {
        
        let cancelBag = CancelBag()
        users.wrappedValue.setIsLoading(cancelBag: cancelBag)
        
        bgQueue.asyncAfter(deadline: stubLoadingDelay) {
            stubNetworkRequest
                .sinkToLoadable { users.wrappedValue = $0 }
                .store(in: cancelBag)
        }
    }
}
