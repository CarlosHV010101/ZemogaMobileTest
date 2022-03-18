//
//  PostCell.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct PostCell: View {
    @StateObject private var viewModel: PostViewModel
    
    init(viewModel: PostViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: PostDetailView(),
                tag: PostViewModel.Router.details,
                selection: $viewModel.route,
                label: { EmptyView() }
            )
            
            HStack {
                            
                Image(systemName: IconConstants.PostCell.star)
                    .foregroundColor(.yellow)
                
                Text("Secondary line text Lorem Ipsum amet, consectur adispicing elit. Nam massa quam")
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
        PostCell(viewModel: PostViewModel())
    }
}
