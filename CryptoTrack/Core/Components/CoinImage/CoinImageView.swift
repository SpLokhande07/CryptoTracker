//
//  CoinImageView.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 30/03/24.
//

import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    
    private let coin: CoinModel
    
    private var cancellable: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        downloadCoinImage()
    }
    
    private func downloadCoinImage(){
        guard let url = URL(string: coin.symbol ?? "") else { return }
        
        cancellable = NetworkingManager.download(url: url)
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] (data) in
                guard let self = self else { return }
                self.image = UIImage(data: data)
            }
    }
}

struct CoinImageView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CoinImageView()
}
