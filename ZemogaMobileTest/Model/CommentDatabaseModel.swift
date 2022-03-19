//
//  CommentDatabaseModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation

class CommentDatabaseModel {
    var id: Int = 0
    var postId: Int = 0
    var body: String = ""
    
    init(id: Int, postId: Int, body: String) {
        self.id = id
        self.postId = postId
        self.body = body
    }
}
