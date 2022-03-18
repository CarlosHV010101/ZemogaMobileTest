//
//  MainViewModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var allPosts = 1
    @Published var favoritePosts = 2
    @Published var currentPostListSelection: PostListSelection = .all
    
    public func loadPosts() {
        
    }
    
    public func deleteAllPosts() {
        
    }
}
