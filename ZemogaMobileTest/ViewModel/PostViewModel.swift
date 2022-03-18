//
//  PostViewModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

final class PostViewModel: ObservableObject {
    
    @Published var route: Router?
    
    
    public func goToDetails() {
        self.route = .details
    }
}

//MARK: - ROUTER
extension PostViewModel {
    public enum Router {
        case details
    }
}
