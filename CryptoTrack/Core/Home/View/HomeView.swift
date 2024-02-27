//
//  HomeView.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 25/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack{
            // background layer
            Color.theme.background.ignoresSafeArea()
            VStack{
               homeHeader
                Spacer(minLength: nil)
            }
        }
    }
}

#Preview {
    NavigationView{
        HomeView().navigationBarHidden(true)
}}


extension HomeView {
    
    
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus": "info").animation(.none)
                .background(
                CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding()
    }
}
