//
//  ContentView.swift
//  fusion
//
//  Created by Rob Broadwell on 12/18/22.
//

import SwiftUI
import Combine

// MARK: - View

struct ContentView: View {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        ContactsList(viewModel: .init(container: viewModel.container))
    }
}

// MARK: - ViewModel

extension ContentView {
    class ViewModel: ObservableObject {
        
        let container: DIContainer
        
        init(container: DIContainer) {
            self.container = container
        }
    }
}

// MARK: - Preview

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentView.ViewModel(container: .preview))
    }
}
#endif
