//
//  CommentsSectionView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct CommentsSectionView: View {
    @Binding private var comments: [CommentViewModel]
    
    init(comments: Binding<[CommentViewModel]>) {
        self._comments = comments
    }
    
    var body: some View {
        VStack {
            CommentsHeaderView()
            
            ForEach(comments, id: \.id) { comment in
                CommentView(viewModel: comment)
            }
        }
    }
}

struct CommentsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsSectionView(comments: .constant([]))
    }
}
