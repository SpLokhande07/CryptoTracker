//
//  HomeView.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 25/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPorfolio: Bool = false
    
    var body: some View {
        ZStack{
            // background layer
            Color.theme.background.ignoresSafeArea()
            
            
            //content layer
            VStack{
               homeHeader
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
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
            CircleButtonView(iconName: showPorfolio ? "plus": "info").animation(.none)
                .background(
                CircleButtonAnimationView(animate: $showPorfolio))
            Spacer()
            Text(showPorfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPorfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPorfolio.toggle()
                    }
                }
        }
        .padding()
    }
}
