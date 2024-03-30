//
//  CoinImageViewModel.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 30/03/24.
//

import Foundation
import Combine
import SwiftUI



class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    
//    private let coin: CoinModel?
    
    @Published var isLoading : Bool = false
    
    private let coin : CoinModel?
    private var cancellable = Set<AnyCancellable>()
    private let imageService : CoinImageService
    
    
    init(coin : CoinModel) {
        self.coin = coin
        self.imageService = CoinImageService(coin: coin)
        self.adddImageSubscribers()
    }
    
    private func adddImageSubscribers(){
        
        imageService.$image.sink { [weak self] (_) in
            self?.isLoading = false
        } receiveValue: { [weak self] (returnedImage) in
            self?.image = returnedImage
        }
        .store(in: &cancellable)

        
    }
}
