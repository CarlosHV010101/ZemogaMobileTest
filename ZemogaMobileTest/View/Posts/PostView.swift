//
//  PostCell.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct PostView: View {
    @StateObject private var viewModel: PostViewModel
    
    init(viewModel: PostViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: PostDetailView(
                    viewModel: PostDetailViewModel(
                        post: viewModel,
                        repository: PostRepository(
                            network: PostNetwork(),
                            database: PostDatabase(),
                            modelAdapter: PostsModelAdapter()
                        )
                    )
                ),
                tag: PostViewModel.Router.details,
                selection: $viewModel.route,
                label: { EmptyView() }
            )
            
            HStack {
                            
                Image(systemName: IconConstants.PostCell.star)
                    .foregroundColor(viewModel.isFavorite ? .yellow : .clear)
                
                Text(viewModel.title)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image(systemName: IconConstants.PostCell.arrow)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 15)
            
            Divider()
        }
        .onTapGesture {
            viewModel.goToDetails()
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostView(
            viewModel: PostViewModel(
                id: 1,
                userId: 25,
                title: "This is a preview",
                body: "Body",
                isFavorite: false
            )
        )
    }
}
