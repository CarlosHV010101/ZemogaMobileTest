//
//  MockModelAdapter.swift
//  ZemogaMobileTestTests
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation
@testable import ZemogaMobileTest

final class MockModelAdapter: PostsModelAdapterProtocol {
    func toDatabaseModel(from networkModel: Post) -> PostDatabaseModel {
        PostDatabaseModel(id: 0, userId: 0, title: "", body: "", isFavorite: false)
    }
    
    func toNetworkModel(from databaseModels: [PostDatabaseModel]) -> [Post] {
        return []
    }
    
    func toNetworkModel(from databaseModel: PostDatabaseModel) -> Post {
        Post(id: 0, userId: 0, title: "", body: "", isFavorite: false)
    }
    
    func toDatabaseModel(from networkModel: Comment) -> CommentDatabaseModel {
        CommentDatabaseModel(id: 0, postId: 0, body: "")
    }
    
    func toNetworkModel(from databaseModels: [CommentDatabaseModel]) -> [Comment] {
        return []
    }
    
    func toDatabaseModel(from networkModel: User) -> UserDatabaseModel {
        UserDatabaseModel(id: 0, name: "", email: "", phone: "", website: "")
    }
    
    func toNetworkModel(from databaseModel: UserDatabaseModel) -> User {
        User(id: 0, name: "", email: "", phone: "", website: "")
    }
}
