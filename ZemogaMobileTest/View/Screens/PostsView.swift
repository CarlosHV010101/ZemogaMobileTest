//
//  PostsView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct PostsView: View {
    var body: some View {
        VStack {
            
            NavigationBarView(
                title: TextConstants.Posts.navigationBarTitle
            ) {
                EmptyView()
            } leftButton: {
                NavigationBarButtonView(
                    action: { },
                    icon: IconConstants.ToolBarIcons.reload
                )
            }

            
            ScrollView {
                
            }
            
            DeletePostsButtonView(action: {})
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
