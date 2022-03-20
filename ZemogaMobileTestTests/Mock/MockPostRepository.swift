//
//  MockPostRepository.swift
//  ZemogaMobileTestTests
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation
@testable import ZemogaMobileTest

final class MockPostRepository: PostRepositoryProtocol {
    var delegate: PostRepositoryDelegate?
    
    var network: PostNetworkProtocol = MockPostNetwork()
    
    var database: PostDatabaseProtocol = MockPostDatabase()
    
    var modelAdapter: PostsModelAdapterProtocol = MockModelAdapter()
    
    func getPosts() {
        return
    }
    
    func getComments(with id: Int) {
        return
    }
    
    func getUser(with userId: Int) {
        return
    }
    
    func toggleFavorite(postId: Int) {
        return
    }
    
    func removePost(postId: Int) {
        return
    }
}
