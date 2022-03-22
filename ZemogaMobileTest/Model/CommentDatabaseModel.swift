//
//  CommentDatabaseModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation
import RealmSwift

class CommentDatabaseModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var postId: Int = 0
    @objc dynamic var body: String = ""
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience init(id: Int, postId: Int, body: String) {
        self.init()
        self.id = id
        self.postId = postId
        self.body = body
    }
}
