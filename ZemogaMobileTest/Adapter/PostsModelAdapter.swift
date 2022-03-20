//
//  PostsModelAdapter.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import Foundation

protocol PostsModelAdapterProtocol {
    func toDatabaseModel(from networkModel: Post) -> PostDatabaseModel
    func toNetworkModel(from databaseModels: [PostDatabaseModel]) -> [Post]
    func toNetworkModel(from databaseModel: PostDatabaseModel) -> Post
    func toDatabaseModel(from networkModel: Comment) -> CommentDatabaseModel
    func toNetworkModel(from databaseModels: [CommentDatabaseModel]) -> [Comment]
    func toDatabaseModel(from networkModel: User) -> UserDatabaseModel
    func toNetworkModel(from databaseModel: UserDatabaseModel) -> User
}

final class PostsModelAdapter: PostsModelAdapterProtocol {
    
    func toDatabaseModel(from networkModel: Post) -> PostDatabaseModel {
        PostDatabaseModel(
            id: networkModel.id ?? 0,
            userId: networkModel.userId ?? 0,
            title: networkModel.title ?? "",
            body: networkModel.body ?? "",
            isFavorite: networkModel.isFavorite ?? false
        )
    }
    
    func toNetworkModel(from databaseModels: [PostDatabaseModel]) -> [Post] {
        databaseModels.map { databaseModel -> Post in
            Post(
                id: databaseModel.id,
                userId: databaseModel.userId,
                title: databaseModel.title,
                body: databaseModel.body,
                isFavorite: databaseModel.isFavorite
            )
        }
    }
    
    func toNetworkModel(from databaseModel: PostDatabaseModel) -> Post {
        Post(
            id: databaseModel.id,
            userId: databaseModel.userId,
            title: databaseModel.title,
            body: databaseModel.body,
            isFavorite: databaseModel.isFavorite
        )
    }
    
    func toDatabaseModel(from networkModel: Comment) -> CommentDatabaseModel {
        CommentDatabaseModel(
            id: networkModel.id ?? 0,
            postId: networkModel.postId ?? 0,
            body: networkModel.body ?? ""
        )
    }

    func toNetworkModel(from databaseModels: [CommentDatabaseModel]) -> [Comment] {
        databaseModels.map { databaseModel -> Comment in
            Comment(
                id: databaseModel.id,
                postId: databaseModel.postId,
                body: databaseModel.body
            )
        }
    }
    
    func toDatabaseModel(from networkModel: User) -> UserDatabaseModel {
        UserDatabaseModel(
            id: networkModel.id ?? 0,
            name: networkModel.name ?? "",
            email: networkModel.email ?? "",
            phone: networkModel.phone ?? "",
            website: networkModel.website ?? ""
        )
    }
    
    func toNetworkModel(from databaseModel: UserDatabaseModel) -> User {
        User(
            id: databaseModel.id,
            name: databaseModel.name,
            email: databaseModel.email,
            phone: databaseModel.phone,
            website: databaseModel.website
        )
    }
}
