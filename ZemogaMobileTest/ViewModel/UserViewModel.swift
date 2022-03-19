//
//  UserViewModel.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import Foundation

final class UserViewModel: ObservableObject {
    
    @Published var id: Int
    @Published var name: String
    @Published var email: String
    @Published var phone: String
    @Published var website: String
    
    init(id: Int, name: String, email: String, phone: String, website: String) {
        self.id = id        
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
    }
}
