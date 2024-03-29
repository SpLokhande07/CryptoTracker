//
//  CoinModel.swift
//  CryptoTrack
//
//  Created by Saiprasad Lokhande on 26/02/24.
//



import Foundation

    
   

    struct CoinModel: Identifiable,Codable {
        let id: String
           let symbol: String?
           let name: String?
           let image: String?
           let currentPrice: Double?
           let marketCap: Double?
           let marketCapRank: Int?
           let fullyDilutedValuation: Double?
           let totalVolume: Double?
           let high24h: Double?
           let low24h: Double?
           let priceChange24h: Double?
           let priceChangePercentage24h: Double?
           let marketCapChange24h: Double?
           let marketCapChangePercentage24h: Double?
           let circulatingSupply: Double?
           let totalSupply: Double?
           let maxSupply: Double?
           let ath: Double?
           let athChangePercentage: Double?
           let athDate: String?
           let atl: Double?
           let atlChangePercentage: Double?
           let atlDate: String?
           let roi: Roi?
           let lastUpdated: String?
           let sparklineIn7d: SparklineData?
           let priceChangePercentage24hInCurrency: Double?
           let currentHoldings: Double?
           
           

       enum CodingKeys: String, CodingKey {
              case id, symbol, name, image
              case currentPrice = "current_price"
              case marketCap = "market_cap"
              case marketCapRank = "market_cap_rank"
              case fullyDilutedValuation = "fully_diluted_valuation"
              case totalVolume = "total_volume"
              case high24h = "high_24h"
              case low24h = "low_24h"
              case priceChange24h = "price_change_24h"
              case priceChangePercentage24h = "price_change_percentage_24h"
              case marketCapChange24h = "market_cap_change_24h"
              case marketCapChangePercentage24h = "market_cap_change_percentage_24h"
              case circulatingSupply = "circulating_supply"
              case totalSupply = "total_supply"
              case maxSupply = "max_supply"
              case ath, athChangePercentage, athDate, atl
              case atlChangePercentage = "atl_change_percentage"
              case atlDate = "atl_date"
              case roi
              case lastUpdated = "last_updated"
              case sparklineIn7d = "sparkline_in_7d"
              case priceChangePercentage24hInCurrency = "price_change_percentage_24h_in_currency"
              case currentHoldings
           }
    
    
        func updateHolding(amount: Double) -> CoinModel{
            return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24h: high24h, low24h: low24h, priceChange24h: priceChange24h, priceChangePercentage24h: priceChangePercentage24h, marketCapChange24h: marketCapChange24h, marketCapChangePercentage24h: marketCapChangePercentage24h, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, roi: roi, lastUpdated: lastUpdated, sparklineIn7d: sparklineIn7d, priceChangePercentage24hInCurrency: priceChangePercentage24hInCurrency, currentHoldings: amount)
        }
        
    var currentHoldingValue : Double {
        return (currentHoldings ?? 0) * (currentPrice ?? 1)
    }
    
    var rank : Int{
        return Int(marketCapRank ?? 100000000000 )
    }
    
}


struct Roi: Codable {
    let currency: String?
    let percentage: Double?
    let times: Double?
}

struct SparklineData: Codable {
    let price: [Double]?
}
