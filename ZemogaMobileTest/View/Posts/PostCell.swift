//
//  PostCell.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        VStack {
            HStack {
                            
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                Text("Secondary line text Lorem Ipsum amet, consectur adispicing elit. Nam massa quam")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image(systemName: "chevron.forward")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 15)
            
            Divider()
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
