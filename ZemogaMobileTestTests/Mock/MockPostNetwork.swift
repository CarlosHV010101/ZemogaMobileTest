//
//  MockPostNetwork.swift
//  ZemogaMobileTestTests
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation
@testable import ZemogaMobileTest

final class MockPostNetwork: PostNetworkProtocol {
    func getPosts(onSuccess: @escaping onPostsSuccess, onError: @escaping onError) {
        return
    }
    
    func getComments(with id: Int, onSuccess: @escaping onCommentsSuccess, onError: @escaping onError) {
        return
    }
    
    func getUser(with userId: Int, onSuccess: @escaping onUserSuccess, onError: @escaping onError) {
        return
    }
}
