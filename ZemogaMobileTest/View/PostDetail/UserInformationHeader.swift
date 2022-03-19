//
//  UserInformationHeader.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 19/03/22.
//

import SwiftUI

struct UserInformationHeader: View {
    var body: some View {
        Text(TextConstants.PostDetails.User.user)
            .bold()
            .font(.title3)
    }
}

struct UserInformationHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationHeader()
    }
}
