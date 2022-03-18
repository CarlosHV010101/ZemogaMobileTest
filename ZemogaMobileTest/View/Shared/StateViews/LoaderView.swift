//
//  LoaderView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        HStack(spacing: 5) {
            LoaderDot()
            LoaderDot(delay: 0.2)
            LoaderDot(delay: 0.4)
        }
        .foregroundColor(.green)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
