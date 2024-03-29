//
//  CoinDataService.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 03/03/24.
//

import Foundation

class CoinDataService {
    @Published var allCoins : [CoinModel] = []
    
    init(){
        getCoins()  
    }
    
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=INR&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en")
        else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
    }
}
