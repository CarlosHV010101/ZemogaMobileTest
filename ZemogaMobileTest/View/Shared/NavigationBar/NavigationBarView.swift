//
//  NavigationBarView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct NavigationBarView <RightButton: View, LeftButton: View>: View {
    private let title: String
    private let rightButton: RightButton?
    private let leftButton: LeftButton?
    
    init(title: String,
         @ViewBuilder rightButton: () -> RightButton?,
         @ViewBuilder leftButton: () -> LeftButton?) {
        self.title = title
        self.rightButton = rightButton()
        self.leftButton = leftButton()
    }
    
    var body: some View {
        ZStack {
            
            if rightButton != nil {
                HStack {
                    rightButton
                    
                    Spacer()
                }
                .padding(.leading, 15)
            }
            
            Spacer()
            
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
                .padding(.vertical, 15)
            
            Spacer()
            
            if leftButton != nil {
                HStack {
                    Spacer()
                    
                    leftButton
                }
                .padding(.trailing, 15)
            }
        }
        .background(Color.green.edgesIgnoringSafeArea(.top))
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Posts") {
            NavigationBarButtonView(
                action: { },
                icon: IconConstants.ToolBarIcons.back
            )
        } leftButton: {
            NavigationBarButtonView(action: { }, icon: IconConstants.ToolBarIcons.favoriteSelected)
        }
        .previewLayout(.sizeThatFits)
    }
}
