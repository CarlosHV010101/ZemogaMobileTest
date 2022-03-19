//
//  PostDatabaseModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation

class PostDatabaseModel {
    var id: Int = 0
    var userId: Int = 0
    var title: String = ""
    var body: String = ""
    var isFavorite: Bool = false
    
    init(id: Int, userId: Int, title: String, body: String, isFavorite: Bool) {
        //TODO: add super init
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
        self.isFavorite = isFavorite
    }
}
