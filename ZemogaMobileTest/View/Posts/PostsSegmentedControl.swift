//
//  PostsSegmentedControl.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

public enum PostListSelection: String {
    case all, favorites
}

struct PostsSegmentedControl: View {
    @Binding private var listSelection: PostListSelection
    
    init(listSelection: Binding<PostListSelection>) {
        self._listSelection = listSelection
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.green)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.green], for: .normal)
    }
    
    var body: some View {
        Picker("", selection: $listSelection) {
            Text(TextConstants.Posts.segmentedControlAll)
                .tag(PostListSelection.all)
            Text(TextConstants.Posts.segmentedControlFavorites)
                .tag(PostListSelection.favorites)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct PostsSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        PostsSegmentedControl(listSelection: .constant(PostListSelection.all))
            .previewLayout(.sizeThatFits)
    }
}
