//
//  TextConstants.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

public enum TextConstants {
    
    enum Posts {
        static let navigationBarTitle = "Posts"
        static let deleteAllButtonTitle = "Delete All"
        static let segmentedControlAll = "All"
        static let segmentedControlFavorites = "Favorites"
    }
    
    enum PostDetails {
        static let navigationBarTitle = "Post"
        static let descriptionTitle = "Description"
        
        enum User {
            static let user = "User"
            static let name = "Name: "
            static let email = "Email: "
            static let phone = "Phone: "
            static let website = "Website: "
        }
    }
    
    enum Status {
        static let error = "We couldn't load the content. Please verify if your're connected to internet."
    }
}
