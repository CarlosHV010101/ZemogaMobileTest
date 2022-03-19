//
//  PostsLists.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct PostsList: View {
    @Binding private var posts: [PostViewModel]
    
    init(posts: Binding<[PostViewModel]>) {
        self._posts = posts
    }
    
    var body: some View {
        
        VStack {
            ForEach(posts, id: \.id) { post in
                PostView(viewModel: post)
            }
        }
    }
}

struct PostsLists_Previews: PreviewProvider {
    static var previews: some View {
        PostsList(posts: .constant([]))
            .previewLayout(.sizeThatFits)
    }
}
