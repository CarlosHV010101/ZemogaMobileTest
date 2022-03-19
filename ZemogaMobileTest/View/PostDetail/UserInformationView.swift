//
//  UserInformationView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct UserInformationView: View {
    @StateObject private var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                
                UserInformationHeader()
                
                Text(TextConstants.PostDetails.User.name + viewModel.name)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text(TextConstants.PostDetails.User.email + viewModel.email)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text(TextConstants.PostDetails.User.phone + viewModel.phone)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text(TextConstants.PostDetails.User.website + viewModel.website)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 15)
            
            Spacer()
        }
        .padding(.vertical, 10)
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationView(
            viewModel: UserViewModel(
                id: 1,
                name: "Carlos",
                email: "chedezv@gmail.com",
                phone: "55555555",
                website: "www.google.com"
            )
        )
        .previewLayout(.sizeThatFits)
    }
}
