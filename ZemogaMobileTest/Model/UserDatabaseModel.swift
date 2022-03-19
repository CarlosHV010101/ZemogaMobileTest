//
//  UserDatabaseModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation

class UserDatabaseModel {
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var phone: String = ""
    var website: String = ""
    
    init(id: Int, name: String, email: String, phone: String, website: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.website = website
    }
}
