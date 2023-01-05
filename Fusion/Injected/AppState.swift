//
//  AppState.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import SwiftUI
import Combine

struct AppState: Equatable {
    var userData = UserData()
    var system = System()
}

extension AppState {
    struct UserData: Equatable {
        var isLoggedIn: Bool = false
        // ...
    }
}

extension AppState {
    struct System: Equatable {
        var isActive: Bool = false
        // ...
    }
}

func == (lhs: AppState, rhs: AppState) -> Bool {
    return lhs.userData == rhs.userData &&
        lhs.system == rhs.system
}

#if DEBUG
extension AppState {
    static var preview: AppState {
        var state = AppState()
        state.system.isActive = true
        return state
    }
}
#endif
