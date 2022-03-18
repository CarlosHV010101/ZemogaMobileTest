//
//  PostsSegmentedControl.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

public enum PostSelection: String {
    case all, favorites
}

struct PostsSegmentedControl: View {
    @Binding private var listSelection: PostSelection
    
    init(listSelection: Binding<PostSelection>) {
        self._listSelection = listSelection
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.green)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.green], for: .normal)
    }
    
    var body: some View {
        Picker("", selection: $listSelection) {
            Text("All")
                .tag(PostSelection.all)
            Text("Favorites")
                .tag(PostSelection.favorites)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct PostsSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        PostsSegmentedControl(listSelection: .constant(PostSelection.all))
            .previewLayout(.sizeThatFits)
    }
}
