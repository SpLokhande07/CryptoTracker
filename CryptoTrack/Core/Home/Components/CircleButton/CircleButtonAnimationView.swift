//
//  CircleButtonAnimationView.swift
//  CryptoTrack
//
//  Created by Saiprasad Lokhande on 26/02/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate : Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/ : 0)
            .opacity(animate ? 0 : 1)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
    }
}

struct CircleButtonAnimationView_Preview : PreviewProvider {
    static var previews: some View{
        CircleButtonAnimationView(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
