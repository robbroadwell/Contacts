//
//  ContactDetailsViewModel.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import Combine

// MARK: - ViewModel

extension ContactDetails {
    class ViewModel: ObservableObject {
        
        @Published var contact: User
        
        let container: DIContainer
        
        init(container: DIContainer, contact: User) {
            self.container = container
            self.contact = contact
        }
    }
}

