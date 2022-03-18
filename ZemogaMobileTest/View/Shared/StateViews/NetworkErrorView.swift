//
//  NetworkErrorView.swift
//  ZemogaMobileTest
//
//  Created by Carlos Hernández on 18/03/22.
//

import SwiftUI

struct NetworkErrorView: View {
    var body: some View {
        VStack(spacing: 15) {
            
            Image(systemName: IconConstants.Status.wifiError)
            
            Text(TextConstants.Status.error)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
}

struct NetworkErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkErrorView()
    }
}
