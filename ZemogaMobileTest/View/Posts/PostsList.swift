//
//  PostsLists.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct PostsList: View {
    var body: some View {
        
        VStack {
            ForEach(1..<5, id: \.self) { _ in
                PostCell(viewModel: PostViewModel())
            }
        }
    }
}

struct PostsLists_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
            .previewLayout(.sizeThatFits)
    }
}
