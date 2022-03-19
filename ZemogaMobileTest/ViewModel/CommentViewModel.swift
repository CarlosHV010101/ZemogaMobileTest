//
//  CommentViewModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

final class CommentViewModel: ObservableObject {
    
    @Published var id: Int
    @Published var body: String
    
    init(id: Int, body: String) {
        self.id = id
        self.body = body
    }
}
