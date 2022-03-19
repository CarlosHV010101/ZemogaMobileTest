//
//  PostDetailViewModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

final class PostDetailViewModel: ObservableObject {
    
    @Published var currentPost: PostViewModel
    @Published var user: UserViewModel?
    @Published var comments: [CommentViewModel] = []
    @Published var isLoadingUser: Bool = false
    @Published var isLoadingComments: Bool = false
    @Published var getUserHasError: Bool = false
    @Published var getCommentsHasError: Bool = false
    
    private var postRepository: PostRepositoryProtocol
    
    init(post: PostViewModel, repository: PostRepositoryProtocol) {
        self.currentPost = post
        self.postRepository = repository
        self.postRepository.delegate = self
        self.getUser()
        self.getComments()
    }
    
    private func getUser() {
        isLoadingUser = true
        postRepository.getUser(with: currentPost.userId)
    }
    
    private func getComments() {
        isLoadingComments = true
        postRepository.getComments(with: currentPost.id)
    }
    
    public func toggleFavorite() {
        postRepository.toggleFavorite(postId: currentPost.id)
    }
    
    public func removePost() {
        postRepository.removePost(postId: currentPost.id)
    }
}

//MARK: - PostRepositoryDelegate
extension PostDetailViewModel: PostRepositoryDelegate {
    func didUpdateCommentsWithSuccess(_ comments: [Comment]) {
        isLoadingComments = false
        getCommentsHasError = false
        
        self.comments = comments.map { comment -> CommentViewModel in
            CommentViewModel(
                id: comment.id ?? 0,
                body: comment.body ?? ""
            )
        }
    }
    
    func didFailGetComments() {
        isLoadingComments = false
        getCommentsHasError = true
    }
    
    func didUpdateUserWithSuccess(_ user: User) {
        isLoadingUser = false
        getUserHasError = false
        
        self.user = UserViewModel.init(id: user.id ?? 0,
                                       name: user.name ?? "",
                                       email: user.email ?? "",
                                       phone: user.phone ?? "",
                                       website: user.website ?? "")
    }
    
    func didFailGetUser() {
        isLoadingUser = false
        getUserHasError = true
    }
}
