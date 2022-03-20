//
//  CommentsHeaderView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct CommentsHeaderView: View {
    var body: some View {
        HStack {
            Text(TextConstants.PostDetails.Comments.headerTitle)
            
            Spacer()
        }
        .padding(.vertical, 5)
        .padding(.leading, 15)
        .background(Color.gray.opacity(0.7))
    }
}

struct CommentsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsHeaderView()
            .previewLayout(.sizeThatFits)
    }
}
