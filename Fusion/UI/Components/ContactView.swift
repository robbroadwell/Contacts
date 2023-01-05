//
//  ContactView.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import SwiftUI

struct ContactView: View {
    let contact: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(contact.name)
                .font(.title2)
            
            Text(contact.email)
                .font(.callout)
        }
    }
}

#if DEBUG
struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contact: User.mockedData[0])
    }
}
#endif

