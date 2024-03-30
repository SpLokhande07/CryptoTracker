//
//  NetworkingManager.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 29/03/24.
//

import Foundation
import Combine

class NetworkingManager{
    
    enum NetworkError: LocalizedError {
        case badURLResoponse(url: URL)
        case unknownError
        
        var errorDescription: String?{
            switch self {
            case .badURLResoponse(url: let url):
                return "[🔥] Bad URL Response: \(url)"
            case .unknownError:
                return "[⚠️] Unknown Error"
            }
        }
    }
    
    static func download(url: URL) ->  Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>, Data>, DispatchQueue> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap( { try handleURLResponse(output: $0, url: url)})
        .receive(on: DispatchQueue.main)}
    
    
    static func handleURLResponse (output : URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{

        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkError.badURLResoponse(url: url)
        }
        //                print(String(data: output.data, encoding: .utf8) ?? "Data could not be printed")
        return output.data
    }
    
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}

