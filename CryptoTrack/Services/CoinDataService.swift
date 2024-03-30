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
        
        
///        URLSession.shared: This is a singleton session provided by the system that has a default configuration.
        
///        [dataTaskPublisher(for: request)]: This method creates a publisher that sends a request to a server and publishes a tuple upon receipt of a response.
        
///        [.subscribe(on: DispatchQueue.global(qos: .default))] :  This specifies that the network request should be performed on a background queue, not blocking the main queue. The qos: .default parameter sets the quality of service for the queue, which affects the priority of the tasks in the queue
        
///        [.tryMap { (output) -> Data in ... }]:  This is a transformation operation. It attempts to convert the output of the previous operation into Data
        
        
        cancellable = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.cancellable?.cancel()
            })
//            .sink { (completion) in
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            } receiveValue: { [weak self] (returnedCoins) in
//                self?.allCoins = returnedCoins
//                self?.cancellable?.cancel()
//            }
    }

}
