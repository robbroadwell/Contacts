//
//  ContactsList.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import SwiftUI
import Combine

struct ContactsList: View {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            self.content
                .navigationBarTitle("Contacts")
                .animation(.easeOut, value: 0.3)
        }
    }
    
    @ViewBuilder private var content: some View {
        switch viewModel.users {
        case .notRequested:
            notRequestedView
        case .isLoading:
            loadingView()
        case let .loaded(countries):
            loadedView(countries)
        case let .failed(error):
            failedView(error)
        }
    }
}

// MARK: - Loading Content

private extension ContactsList {
    var notRequestedView: some View {
        Text("").task { self.viewModel.reloadUsers() }
    }
    
    func loadingView() -> some View {
        return ProgressView()
    }
    
    func failedView(_ error: Error) -> some View {
        ErrorView(error: error, retryAction: {
            self.viewModel.reloadUsers()
        })
    }
}

// MARK: - Displaying Content

private extension ContactsList {
    func loadedView(_ users: [User]) -> some View {
        VStack {
            
            List(users) { user in
                NavigationLink {
                    ContactDetails(viewModel: .init(container: viewModel.container, contact: user))
                } label: {
                    ContactView(contact: user)
                }
            }
            
        }
    }
}

// MARK: - Preview

#if DEBUG
struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsList(viewModel: .init(container: .preview))
    }
}
#endif
