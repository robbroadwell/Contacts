//
//  ServicesContainer.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

extension DIContainer {
    struct Services {
        let usersService: UsersService
        
        init(usersService: UsersService) {
            self.usersService = usersService
        }
        
        static var stub: Self {
            .init(usersService: StubUsersService())
        }
    }
}
