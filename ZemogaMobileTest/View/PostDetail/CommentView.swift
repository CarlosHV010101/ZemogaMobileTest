//
//  CommentCellView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct CommentView: View {
    @StateObject private var viewModel: CommentViewModel
    
    init(viewModel: CommentViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("Cell description which explains the consequences of above action")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 15)
                .padding(.bottom, 15)
            
            Divider()
        }
    }
}

struct CommentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(viewModel: CommentViewModel(id: 1, body: ""))
    }
}
