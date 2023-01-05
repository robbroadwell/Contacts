//
//  ContactDetails.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import SwiftUI
import Combine

struct ContactDetails: View {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        
        VStack {
            Text(viewModel.contact.name)
                .font(.largeTitle)
            
            Divider()
                                    
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.contact.email)
                Text(viewModel.contact.phone)
                Text(viewModel.contact.website)
                
                Color.clear.frame(height: 20)
                
                Text(viewModel.contact.address.street)
                Text(viewModel.contact.address.city + ", " + viewModel.contact.address.zipcode)
            }
            .padding()
            
            Color.clear
        }
    }
}

// MARK: - Preview

#if DEBUG
struct ContactDetails_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetails(viewModel: .init(container: .preview, contact: User.mockedData[0]))
    }
}
#endif
