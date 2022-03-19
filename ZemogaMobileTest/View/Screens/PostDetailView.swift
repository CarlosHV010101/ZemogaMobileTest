//
//  PostDetailView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: PostDetailViewModel
    
    init(viewModel: PostDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            
            VStack {
                NavigationBarView(
                    title: TextConstants.PostDetails.navigationBarTitle) {
                    NavigationBarButtonView(
                        action: { presentationMode.wrappedValue.dismiss() },
                        icon: IconConstants.ToolBarIcons.back
                    )
                } leftButton: {
                    NavigationBarButtonView(
                        action: viewModel.toggleFavorite,
                        icon: IconConstants.ToolBarIcons.favorite
                    )
                }
                
                PostDescriptionView(postDescription: viewModel.currentPost.body)
                
                if viewModel.isLoadingUser {
                    VStack {
                        UserInformationHeader()
                        
                        LoaderView()
                            .padding()
                    }
                } else if viewModel.getUserHasError {
                    VStack {
                        UserInformationHeader()
                        
                        NetworkErrorView()
                            .padding()
                    }
                } else {
                    if viewModel.user != nil {
                        UserInformationView(viewModel: viewModel.user!)
                    }
                }
                
                if viewModel.isLoadingComments {
                    VStack {
                        CommentsHeaderView()
                        
                        LoaderView()
                            .padding
                    }
                } else if viewModel.getCommentsHasError {
                    VStack {
                        CommentsHeaderView()
                        
                        NetworkErrorView()
                            .padding()
                    }
                } else {
                    CommentsSectionView(comments: $viewModel.comments)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(
            viewModel: PostDetailViewModel(
                post: PostViewModel(
                    id: 0,
                    userId: 25,
                    title: "Title",
                    body: "",
                    isFavorite: false
                ),
                repository: PostRepository(
                    network: PostNetwork()
                )
            )
        )
    }
}
