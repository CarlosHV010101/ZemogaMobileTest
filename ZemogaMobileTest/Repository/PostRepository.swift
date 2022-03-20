//
//  PostRepository.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

protocol PostRepositoryDelegate: AnyObject {
    func didUpdatePostsWithSuccess(_ posts: [Post])
    func didFailGetPosts()
    func didUpdatePost(_ post: Post)
    func didUpdateCommentsWithSuccess(_ comments: [Comment])
    func didFailGetComments()
    func didUpdateUserWithSuccess(_ user: User)
    func didFailGetUser()
}

extension PostRepositoryDelegate {
    func didUpdatePostsWithSuccess(_ posts: [Post]) {
        return
    }
    func didFailGetPosts() {
        return
    }
    func didUpdateCommentsWithSuccess(_ comments: [Comment]) {
        return
    }
    func didUpdatePost(_ post: Post) {
        return
    }
    func didFailGetComments() {
        return
    }
    func didUpdateUserWithSuccess(_ user: User) {
        return
    }
    func didFailGetUser() {
        return 
    }
}

protocol PostRepositoryProtocol {
    var delegate: PostRepositoryDelegate? { get set }
    var network: PostNetworkProtocol { get }
    var database: PostDatabaseProtocol { get }
    var modelAdapter: PostsModelAdapterProtocol { get }
    func getPosts()
    func getComments(with id: Int)
    func getUser(with userId: Int)
    func toggleFavorite(postId: Int)
    func removePost(postId: Int)
}

class PostRepository: PostRepositoryProtocol {
    weak var delegate: PostRepositoryDelegate?
    var network: PostNetworkProtocol
    var database: PostDatabaseProtocol
    var modelAdapter: PostsModelAdapterProtocol
    
    init(network: PostNetworkProtocol,
         database: PostDatabaseProtocol,
         modelAdapter: PostsModelAdapterProtocol) {
        self.network = network
        self.database = database
        self.modelAdapter = modelAdapter
    }
    
    public func getPosts() {
        network.getPosts { posts in
            
            posts.forEach { post in
                self.database.savePost(self.modelAdapter.toDatabaseModel(from: post))
            }
            
            let savedPosts =  self.database.fetchPosts()
            
            self.delegate?.didUpdatePostsWithSuccess(posts)
            
            
//            self.delegate?.didUpdatePostsWithSuccess(
//                self.modelAdapter.toNetworkModel(
//                    from: savedPosts
//                )
//            )
        } onError: { error in
            debugPrint("POST ERROR", error)
            if self.isOffline(networkError: error) {
                
                let savedPosts = self.database.fetchPosts()
                
                guard !savedPosts.isEmpty else {
                    self.delegate?.didFailGetPosts()
                    return
                }
                
                self.delegate?.didUpdatePostsWithSuccess(
                    self.modelAdapter.toNetworkModel(
                        from: savedPosts
                    )
                )
                return
            }
            
            self.delegate?.didFailGetPosts()
        }
    }
    
    public func getComments(with id: Int) {
        network.getComments(with: id) { comments in
            
            comments.forEach { comment in
                self.database.saveComment(self.modelAdapter.toDatabaseModel(from: comment))
            }
            
            self.delegate?.didUpdateCommentsWithSuccess(comments)
            
        } onError: { error in
            
            if self.isOffline(networkError: error) {
                
                let savedComments = self.database.fetchComments(with: id)
                
                guard !savedComments.isEmpty else {
                    self.delegate?.didFailGetComments()
                    return
                }
                
                self.delegate?.didUpdateCommentsWithSuccess(
                    self.modelAdapter.toNetworkModel(
                        from: savedComments
                    )
                )
                return
            }
            
            self.delegate?.didFailGetComments()
        }
    }
    
    public func getUser(with userId: Int) {
        network.getUser(with: userId) { user in
            
            self.database.saveUser(self.modelAdapter.toDatabaseModel(from: user))
            self.delegate?.didUpdateUserWithSuccess(user)
            
        } onError: { error in
            if self.isOffline(networkError: error) {
                let savedUser = self.database.fetchUser(with: userId)
                
                guard let user = savedUser else {
                    self.delegate?.didFailGetUser()
                    return
                }
                
                self.delegate?.didUpdateUserWithSuccess(
                    self.modelAdapter.toNetworkModel(
                        from: user
                    )
                )
            }
            
            self.delegate?.didFailGetUser()
        }
    }
    
    public func toggleFavorite(postId: Int) {
        let post = self.database.toggleFavoriteStatus(postId: postId)
        self.delegate?.didUpdatePost(self.modelAdapter.toNetworkModel(from: post))        
    }
    
    public func removePost(postId: Int) {
        self.database.deletePost(with: postId)
    }
    
    private func isOffline(networkError: String) -> Bool {
        networkError == NetworkError.offline.rawValue
    }
}
