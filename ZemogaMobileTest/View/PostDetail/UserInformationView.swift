//
//  UserInformationView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct UserInformationView: View {
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("User")
                    .bold()
                    .font(.title3)
                
                Text("Name")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("Email")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("Phone")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("Website")
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
        UserInformationView()
            .previewLayout(.sizeThatFits)
    }
}
