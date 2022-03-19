//
//  CommentModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

struct Comment: Codable {
    let id: Int?
    let postId: Int?
    let body: String?
}
