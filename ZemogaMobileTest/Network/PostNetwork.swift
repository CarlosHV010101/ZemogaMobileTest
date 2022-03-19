//
//  PostNetwork.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

typealias onPostsSuccess = ([Post]) -> Void
typealias onCommentsSuccess = ([Comment]) -> Void
typealias onUserSuccess = (User) -> Void
typealias onError = (String) -> Void

protocol PostNetworkProtocol {
    func getPosts(onSuccess: @escaping onPostsSuccess, onError: @escaping onError)
    func getComments(with id: Int,
                     onSuccess: @escaping onCommentsSuccess,
                     onError: @escaping onError)
    func getUser(with userId: Int,
                 onSuccess: @escaping onUserSuccess,
                 onError: @escaping onError)
}

final class PostNetwork: PostNetworkProtocol {
        
    let session: URLSession = URLSession(configuration: .default)
    let decoder: JSONDecoder = JSONDecoder()
    
    func getPosts(onSuccess: @escaping onPostsSuccess, onError: @escaping onError) {
        
        guard let url = URL(string: "\(URLContants.BASE_URL)\(URLContants.POSTS_URL)") else {
            onError("Invalid URL")
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    
                    if response.statusCode == 200 {
                        let posts = try self.decoder.decode([Post].self, from: data)
                        
                        onSuccess(posts)
                        return
                    }
                    
                } catch {
                    onError(error.localizedDescription)
                    return
                }
            }
            
        }
        
        task.resume()
    }
    
    func getComments(with id: Int,
                     onSuccess: @escaping onCommentsSuccess,
                     onError: @escaping onError
    ) {
    
        guard let url = URL(string: "\(URLContants.BASE_URL)/\(id)\(URLContants.COMMENTS_URL)") else {
            onError("Invalid URL")
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        let comments = try self.decoder.decode([Comment].self, from: data)
                        onSuccess(comments)
                        return
                    }
                } catch {
                    onError(error.localizedDescription)
                    return
                }
            }
        }
        
        task.resume()
        
    }
    
    func getUser(with userId: Int,
                 onSuccess: @escaping onUserSuccess,
                 onError: @escaping onError
    ) {
        
        guard let url = URL(string: "\(URLContants.BASE_URL)\(URLContants.USER_URL)/\(userId)") else {
            onError("Invalid URL")
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        
                        let user = try self.decoder.decode(User.self, from: data)
                        
                        onSuccess(user)
                        return
                    }
                } catch {
                    onError(error.localizedDescription)
                    return
                }
            }
        }
        
        task.resume()
        
    }
    
}
