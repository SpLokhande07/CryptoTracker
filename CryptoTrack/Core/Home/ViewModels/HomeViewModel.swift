//
//  HomeViewModel.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 03/03/24.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject{
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    @Published var searchText : String = ""
    private let dataService = CoinDataService()
    private var cancellables  = Set<AnyCancellable>()
    
    
    init(){
        addSubscribribers()
    }
    
    func addSubscribribers(){
        // updates coins
        $searchText
                .combineLatest(dataService.$allCoins)
                .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
                .map(filterCoins)
                .sink {
                    [weak self] (returnedCoins) in self?.allCoins = returnedCoins
                }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, startingCoins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return startingCoins
        }
        
        let lowercasedText = text.lowercased()
        
        return startingCoins.filter{
            (coins) -> Bool in
            return coins.name.lowercased().contains(lowercasedText) ||
            coins.symbol.lowercased().contains(lowercasedText) ||
            coins.id.lowercased().contains(lowercasedText)
        }
        
        
    }
    
}
