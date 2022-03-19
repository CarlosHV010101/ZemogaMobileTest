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
    func didUpdateCommentsWithSuccess(_ comments: [Comment])
    func didFailGetComments()
    func didUpdateUserWithSuccess(_ user: User)
    func didFailGetUser()
}

protocol PostRepositoryProtocol {
    var delegate: PostRepositoryDelegate? { get set }
    var network: PostNetworkProtocol { get }
    func getPosts()
    func getComments(with id: Int)
    func getUser(with userId: Int)
}

class PostRepository: PostRepositoryProtocol {
    weak var delegate: PostRepositoryDelegate?
    var network: PostNetworkProtocol
    
    init(network: PostNetworkProtocol) {
        self.network = network
    }
    
    public func getPosts() {
        network.getPosts { posts in
            self.delegate?.didUpdatePostsWithSuccess(posts)
        } onError: { error in
            self.delegate?.didFailGetPosts()
        }
    }
    
    public func getComments(with id: Int) {
        network.getComments(with: id) { (comments) in
            self.delegate?.didUpdateCommentsWithSuccess(comments)
        } onError: { error in
            self.delegate?.didFailGetComments()
        }
    }
    
    public func getUser(with userId: Int) {
        network.getUser(with: userId) { user in
            self.delegate?.didUpdateUserWithSuccess(user)
        } onError: { error in
            self.delegate?.didFailGetUser()
        }
    }
    
}
