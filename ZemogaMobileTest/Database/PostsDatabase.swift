//
//  PostsDatabase.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation

protocol PostDatabaseProtocol {
    func savePost(_ post: PostDatabaseModel)
    func fetchPosts() -> [PostDatabaseModel]
    func deletePost(with id: Int) 
    func toggleFavoriteStatus(postId: Int) -> PostDatabaseModel?
    func deleteAll()
    func saveComment(_ comment: CommentDatabaseModel)
    func fetchComments(with postId: Int) -> [CommentDatabaseModel]
    func saveUser(_ user: UserDatabaseModel)
    func fetchUser(with id: Int) -> UserDatabaseModel?
}

final class PostDatabase: PostDatabaseProtocol {
    
//    private var realm: Realm {
//        do {
//            let realm = try Realm()
//            return realm
//        } catch {
//            debugPrint("Could not access database", error.localizedDescription)
//        }
//    }
    
    func savePost(_ post: PostDatabaseModel) {
//        do {
//            try realm.write {
//                //Veriffy if is favorite
//                realm.add(post, update: .modified)
//            }
//        } catch {
//
//        }
    }
    
    func fetchPosts() -> [PostDatabaseModel] {
//        realm.objects(ofType:PostDatabaseModel.self)
        return []
    }
    
    func deletePost(with id: Int) {
//        do {
//            try realm.write {
//                if let existentPost = realm.object(ofType: PostDatabaseModel.self, forPrimaryKey: id) {
//                    realm.delete(existentPost)
//                }
//            }
//        } catch {
//            debugPrint("Could not delete post")
//        }
    }
    
    func toggleFavoriteStatus(postId: Int) -> PostDatabaseModel? {
//        if let post = realm.object(oFType: PostDatabaseModel.self, forPrimeryKey: postId) {
//            do {
//                try realm.write {
//                    post.isFavorite.toggle()
//                    realm.add(post, update: .modified)
//                }
//            } catch {
//                debugPrint("Could not toggle favorite")
//            }
//        }        
        return PostDatabaseModel(id: 0, userId: 0, title: "", body: "", isFavorite: false)
    }
    
    func deleteAll() {
//        do {
//            try realm.write {
//                realm.deleteAll()
//            }
//        } catch {
//            debugPrint("Could not delete all", error.localizedDescription)
//        }
    }
    
    func saveComment(_ comment: CommentDatabaseModel) {
//        do {
//            try real.write {
//                real.add(comment, updated: .modified)
//            }
//        } catch {
//            debugPrint("Could not save comment", error.localizedDescription)
//        }
    }
    
    func fetchComments(with postId: Int) -> [CommentDatabaseModel] {
//        realm.objects(ofType: CommentDatabaseModel.self).filter("postId CONTAINS[cd] %@", postId)
        return []
    }
    
    func saveUser(_ user: UserDatabaseModel) {
//        do {
//            try realm.write {
//                realm.add(user, updated: .modified)
//            }
//        } catch {
//            debugPrint("Could not save user", error.localizedDescription)
//        }
    }
    
    func fetchUser(with id: Int) -> UserDatabaseModel? {
//        realm.object(ofType: UserDatabaseModel.self, forPrimaryKey: id)
        return nil
    }
}
