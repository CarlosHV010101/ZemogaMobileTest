//
//  MockPostDatabase.swift
//  ZemogaMobileTestTests
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation
@testable import ZemogaMobileTest

final class MockPostDatabase: PostDatabaseProtocol {
    func savePost(_ post: PostDatabaseModel) {
        return
    }
    
    func fetchPosts() -> [PostDatabaseModel] {
        return []
    }
    
    func deletePost(with id: Int) {
        return
    }
    
    func toggleFavoriteStatus(postId: Int) -> PostDatabaseModel {
        PostDatabaseModel(id: 0, userId: 0, title: "", body: "", isFavorite: false)
    }
    
    func deleteAll() {
        return
    }
    
    func saveComment(_ comment: CommentDatabaseModel) {
        return
    }
    
    func fetchComments(with postId: Int) -> [CommentDatabaseModel] {
        return []
    }
    
    func saveUser(_ user: UserDatabaseModel) {
        return
    }
    
    func fetchUser(with id: Int) -> UserDatabaseModel? {
        return nil
    }
}
