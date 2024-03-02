//
//  CircleButtonView.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 25/02/24.
//

import SwiftUI

struct CircleButtonView: View {

    let iconName: String

    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(Circle().foregroundColor(Color.theme.background))
            .shadow(
                color: Color.theme.accent.opacity(0.2),                radius: 10,x: 0.0, y: 0.0
            )
            .padding()
    }
}

#Preview {
    Group{
        CircleButtonView(iconName:"info").previewLayout(.sizeThatFits)
        CircleButtonView(iconName:"plus").previewLayout(.sizeThatFits)
    }
}
