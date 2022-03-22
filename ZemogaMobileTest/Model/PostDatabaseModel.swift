//
//  PostDatabaseModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation
import RealmSwift

class PostDatabaseModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var userId: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience init(id: Int, userId: Int, title: String, body: String, isFavorite: Bool) {
        self.init()
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
        self.isFavorite = isFavorite
    }
}
