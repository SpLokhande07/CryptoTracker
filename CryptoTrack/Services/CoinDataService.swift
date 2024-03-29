//
//  CoinDataService.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 03/03/24.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins : [CoinModel] = []
    
    var cancellable : AnyCancellable?
    
    init(){
        getCoins()  
    }
    
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&sparkline=true&price_change_percentage=24h") else { return }
        let headers = ["x-cg-demo-api-key": "CG-8cXKd89E4xa88f5zbNX5daUt"]

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
//                print(String(data: output.data, encoding: .utf8) ?? "Data could not be printed")
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.cancellable?.cancel()
            }
    }

}
