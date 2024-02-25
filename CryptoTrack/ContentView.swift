//
//  ContentView.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 25/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            VStack(spacing: 48) {
        
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                Text("Secondary Color")
                    .foregroundColor(Color.theme.secondaryTextColor)
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
            }
            .padding()
        
        }
        .font(.headline)
    }
}

#Preview {
    ContentView()
}
