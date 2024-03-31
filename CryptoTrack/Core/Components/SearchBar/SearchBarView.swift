//
//  SearchBarView.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 31/03/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    Color.theme.secondaryTextColor :  Color.theme.accent)
            
            TextField("Search by name",text: $searchText).foregroundColor(Color.theme.accent)
                .overlay(Image(systemName: "xmark.circle.fill").padding().offset(x:10)
                    .foregroundColor(Color.theme.accent)
                    .opacity(searchText.isEmpty ? 0 : 1)
                    .onTapGesture {
                        UIApplication.shared.endEdting()
                        searchText = ""
                    }
                         
                         
                         
                         , alignment: .trailing)
        }
        .font(.headline)
        .padding()
        .background(RoundedRectangle(cornerRadius: 25)
            .fill(Color.theme.background)
            .shadow(color: Color.theme.accent.opacity(0.15), radius: 10,
                    x:0,y:0)
        )
        .padding()
    }
}

struct SearchBarView_Preview : PreviewProvider {
    static var previews: some View{
        Group{
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits).preferredColorScheme(.dark)
            SearchBarView(searchText: .constant("")).previewLayout(.sizeThatFits).preferredColorScheme(.light)
        }
    }
}
