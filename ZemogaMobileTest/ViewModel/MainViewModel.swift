//
//  MainViewModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var allPosts: [PostViewModel] = []
    @Published var favoritePosts: [PostViewModel] = []
    @Published var currentPostListSelection: PostListSelection = .all
    
    private var postRepository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol) {
        self.postRepository = repository
        self.postRepository.delegate = self
    }
    
    public func loadPosts() {
        postRepository.getPosts()
    }
    
    public func deleteAllPosts() {
        
    }
}

//MARK: - PostRepositoryDelegate
extension MainViewModel: PostRepositoryDelegate {
    func didUpdatePostsWithSuccess(_ posts: [Post]) {
        
    }
    
    func didFailGetPosts() {
        
    }
}
