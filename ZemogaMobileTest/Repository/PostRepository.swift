//
//  PostRepository.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

protocol PostRepositoryDelegate: AnyObject {
    
}

protocol PostRepositoryProtocol {
    var delegate: PostRepositoryDelegate? { get set }
}

class PostRepository: PostRepositoryProtocol {
    weak var delegate: PostRepositoryDelegate?
    
}
