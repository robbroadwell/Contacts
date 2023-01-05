//
//  ContactsListViewModel.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import Combine

// MARK: - ViewModel

extension ContactsList {
    class ViewModel: ObservableObject {
        
        @Published var users: Loadable<[User]>
        
        let container: DIContainer
        
        init(container: DIContainer, users: Loadable<[User]> = .notRequested) {
            self.container = container
            self.users = users
        }

        // MARK: - Side Effects
        
        func reloadUsers() {
            container.services.usersService
                .load(users: loadableSubject(\.users))
        }
    }
}

