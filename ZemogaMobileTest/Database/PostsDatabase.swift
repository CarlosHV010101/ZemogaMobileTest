//
//  PostsDatabase.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation

protocol PostDatabaseProtocol {
    func savePost(_ post: PostDatabaseModel)
    func fetchPosts() -> [PostDatabaseModel]
    func deletePost(with id: Int) 
    func toggleFavoriteStatus()
    func deleteAll()
    func saveComment(_ comment: CommentDatabaseModel)
    func fetchComments(with postId: Int) -> [CommentDatabaseModel]
    func saveUser(_ user: UserDatabaseModel)
    func fetchUser(with id: Int) -> UserDatabaseModel?
}

final class PostDatabase: PostDatabaseProtocol {
    
    func savePost(_ post: PostDatabaseModel) {
        
    }
    
    func fetchPosts() -> [PostDatabaseModel] {
        return []
    }
    
    func deletePost(with id: Int) {
        
    }
    
    func toggleFavoriteStatus() {
        
    }
    
    func deleteAll() {
        
    }
    
    func saveComment(_ comment: CommentDatabaseModel) {
        
    }
    
    func fetchComments(with postId: Int) -> [CommentDatabaseModel] {
        return []
    }
    
    func saveUser(_ user: UserDatabaseModel) {
        
    }
    
    func fetchUser(with id: Int) -> UserDatabaseModel? {
        return nil
    }
}
