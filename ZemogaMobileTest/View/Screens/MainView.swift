//
//  PostsView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationBarView(
                    title: TextConstants.Posts.navigationBarTitle
                ) {
                    EmptyView()
                } leftButton: {
                    NavigationBarButtonView(
                        action: viewModel.loadPosts,
                        icon: IconConstants.ToolBarIcons.load
                    )
                }
                
                VStack(spacing: 50) {
                    PostsSegmentedControl(listSelection: $viewModel.currentPostListSelection)
                        .padding(.horizontal, 15)
                    
                    ScrollView(showsIndicators: false) {
                        
                        switch viewModel.currentPostListSelection {
                        case .all:
                            PostsList()
                        case .favorites:
                            PostsList()
                        }
                    }
                }
                
                DeletePostsButtonView(action: viewModel.deleteAllPosts)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
