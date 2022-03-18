//
//  DeletePostsButton.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct DeletePostsButtonView: View {
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Spacer()
                
                Text(TextConstants.Posts.deleteAllButtonTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                
                Spacer()
            }
        }
        .background(Color.red)
    }
}

struct DeletePostsButton_Previews: PreviewProvider {
    static var previews: some View {
        DeletePostsButtonView(action: { })
            .previewLayout(.sizeThatFits)
    }
}
