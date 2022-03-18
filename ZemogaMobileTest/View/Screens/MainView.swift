//
//  PostsView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct MainView: View {
    @State private var selection: PostSelection = .all
    
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
            
            PostsSegmentedControl(listSelection: $selection)
                .padding(.horizontal, 15)
            
            ScrollView(showsIndicators: false) {
                
                switch selection {
                case .all:
                    PostsList()
                case .favorites:
                    PostsList()
                }
            }
            
            DeletePostsButtonView(action: {})
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
