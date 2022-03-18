//
//  PostDetailView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                NavigationBarView(
                    title: "Post") {
                    NavigationBarButtonView(
                        action: { presentationMode.wrappedValue.dismiss() },
                        icon: IconConstants.ToolBarIcons.back
                    )
                } leftButton: {
                    NavigationBarButtonView(
                        action: { },
                        icon: IconConstants.ToolBarIcons.favorite
                    )
                }

                PostDescriptionView(postDescription: "struct NavigationBarView <RightButton: View, LeftButton: View>: View {")
                
                UserInformationView()
                
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView()
    }
}
