//
//  MockedData.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

extension User {
    
    static let mockedData: [User] = [
        User(id: 0, name: "Rob", username: "rob", email: "hello@robbroadwell.com", address: mockedAddress, phone: "999-999-9999", website: "www.robbroadwell.com", company: mockedCompany)
    ]
    
    static let mockedAddress = Address(street: "123 Example St", suite: "A", city: "Grand Rapids", zipcode: "49506", geo: mockedGeo)
    
    static let mockedGeo = Geo(lat: "99.9", lng: "99.9")
    
    static let mockedCompany = Company(name: "Alphabet", catchPhrase: "", bs: "")
    
}
