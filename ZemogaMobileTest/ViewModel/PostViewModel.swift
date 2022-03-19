//
//  PostViewModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

final class PostViewModel: ObservableObject {
    
    @Published var id: Int
    @Published var userId: Int
    @Published var title: String
    @Published var body: String
    @Published var isFavorite: Bool
    @Published var route: Router?
    
    init(id: Int, userId: Int, title: String, body: String, isFavorite: Bool) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
        self.isFavorite = isFavorite
    }
    
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
