//
//  ContentView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView(
            viewModel: MainViewModel(
                repository: PostRepository(
                    network: PostNetwork(),
                    database: PostDatabase(),
                    modelAdapter: PostsModelAdapter()
                )
            )
        )
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
