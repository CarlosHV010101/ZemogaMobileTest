//
//  CommentsSectionView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct CommentsSectionView: View {
    
    var body: some View {
        VStack {
            CommentsHeaderView()
            
            ForEach(0..<3, id: \.self) { _ in
                CommentCellView()
            }
        }
    }
}

struct CommentsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsSectionView()
    }
}
