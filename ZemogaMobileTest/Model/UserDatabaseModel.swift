//
//  UserDatabaseModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation
import RealmSwift

class UserDatabaseModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var website: String = ""
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience init(id: Int, name: String, email: String, phone: String, website: String) {
        self.init()
        self.id = id
        self.name = name
        self.phone = phone
        self.website = website
    }
}
