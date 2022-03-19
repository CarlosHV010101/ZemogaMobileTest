//
//  UserModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

struct User: Codable {
    let id: Int?
    let name: String?
    let email: String?
    let phone: String?
    let website: String?
}
