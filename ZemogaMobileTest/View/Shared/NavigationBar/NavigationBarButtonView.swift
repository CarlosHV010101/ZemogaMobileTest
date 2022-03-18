//
//  NavigationBarButtonView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct NavigationBarButtonView: View {
    private let action: () -> Void
    private let icon: String
    
    init(action: @escaping () -> Void, icon: String) {
        self.action = action
        self.icon = icon
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: icon)
                .background(Color.green)
                .foregroundColor(.white)
        }
    }
}

struct NavigationBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarButtonView(action: { },
                                icon: IconConstants.ToolBarIcons.favoriteSelected
        )
        .previewLayout(.sizeThatFits)
    }
}
