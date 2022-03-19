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
    
    init(post: PostViewModel) {
        self.currentPost = post
    }
    
    private func getUser() {
        
    }
    
    private func getComments() {
        
    }
    
    public func toggleFavorite() {
        
    }
}
