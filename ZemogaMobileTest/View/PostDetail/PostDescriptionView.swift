//
//  PostDescriptionView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct PostDescriptionView: View {
    private let postDescription: String
    
    init(postDescription: String) {
        self.postDescription = postDescription
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                
                Text(TextConstants.PostDetails.descriptionTitle)
                    .bold()
                    .font(.title3)
                
                Text(postDescription)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 15)
            
            Spacer()
        }
    }
}

struct PostDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PostDescriptionView(
            postDescription: "struct NavigationBarView <RightButton: View, LeftButton: View>: View {"
        )
        .previewLayout(.sizeThatFits)
    }
}
