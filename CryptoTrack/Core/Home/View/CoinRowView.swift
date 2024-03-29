//
//  CoinRowView.swift
//  CryptoTrack
//
//  Created by Saiprasad Lokhande on 26/02/24.
//

import SwiftUI

struct CoinRowView: View 
{
    let coin : CoinModel
    let showHoldingColumn:Bool
    
    var body: some View {
        HStack(spacing:0){
          leftColumn
            Spacer()
            if showHoldingColumn {
              centerColumn
            }
            rightColumn
        }.font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View{
        Group{
            CoinRowView(coin: dev.coin,showHoldingColumn: true).previewLayout(.sizeThatFits)
            CoinRowView(coin: dev.coin,showHoldingColumn: true).previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
        }
    }
}

extension CoinRowView{
    private var leftColumn : some View {
        HStack(spacing:0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryTextColor)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol!.uppercased())
                .font(.headline)
                .padding(.leading,6)
                .foregroundColor(Color.theme.accent)
        }
    }

    private var centerColumn:some View {
        VStack (alignment:.trailing){
          
        
            Text(coin.currentHoldingValue.asCurrencyWith2decimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    
    private var rightColumn : some View {
        VStack(alignment: .trailing){
            Text(coin.currentPrice!.asCurrencyWith6decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            
            Text(coin.priceChange24h!.asPercentString() )
                .foregroundColor((coin.priceChangePercentage24h ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
        }.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
 

