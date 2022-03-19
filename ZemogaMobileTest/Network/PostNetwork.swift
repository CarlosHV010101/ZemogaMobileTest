//
//  PostNetwork.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

typealias onPostsSuccess = ([Post]) -> Void
typealias onError = (String) -> Void

protocol PostNetworkProtocol {
    func getPosts(onSuccess: @escaping onPostsSuccess, onError: @escaping onError)
    func getComments(with id: Int)
    func getUser(with id: Int)
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
            
            DispatchQueue.main.async { [self] in
                
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
                        let posts = try decoder.decode([Post].self, from: data)
                        
                        onSuccess(posts)
                    }
                    
                } catch {
                    onError(error.localizedDescription)
                }
            }
            
        }
        
        task.resume()
    }
    
    func getComments(with id: Int) {
        
    }
    
    func getUser(with id: Int) {
        
    }
    
}
