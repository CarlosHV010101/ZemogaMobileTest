//
//  PostModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

struct Post: Codable {
    let id: Int?
    let userId: Int?
    let title: String?
    let body: String?
}
