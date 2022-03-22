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
    @Published var isLoadingPosts: Bool = false
    @Published var getPostsHasError: Bool = false
    
    private var postRepository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol) {
        self.postRepository = repository
        self.postRepository.delegate = self
    }
    
    public func loadPosts() {
        isLoadingPosts = true
        postRepository.getPosts()
    }
    
    public func deleteAllPosts() {
        allPosts.removeAll()
        favoritePosts.removeAll()
        postRepository.removeAll()
    }
    
    private func filterFavorites(_ posts: [PostViewModel]) -> [PostViewModel] {
        posts.filter { $0.isFavorite }
    }
    
    private func filterNotFavorites(_ posts: [PostViewModel]) -> [PostViewModel] {
        posts.filter { !$0.isFavorite }
    }
    
}

//MARK: - PostRepositoryDelegate
extension MainViewModel: PostRepositoryDelegate {
    func didUpdatePostsWithSuccess(_ posts: [Post]) {
        self.isLoadingPosts = false
        self.getPostsHasError = false
        let posts = posts.map { post -> PostViewModel in
            PostViewModel(id: post.id ?? 0,
                          userId: post.userId ?? 0,
                          title: post.title ?? "",
                          body: post.body ?? "",
                          isFavorite: post.isFavorite ?? false)
        }
        
        self.favoritePosts = filterFavorites(posts)
        
        self.allPosts = filterFavorites(posts) + filterNotFavorites(posts)
    }
    
    func didFailGetPosts() {
        self.isLoadingPosts = false
        self.getPostsHasError = true
    }
}
