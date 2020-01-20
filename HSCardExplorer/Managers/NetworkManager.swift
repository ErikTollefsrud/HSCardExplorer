//
//  NetworkManager.swift
//  Redux
//
//  Created by Erik Tollefsrud on 1/13/20.
//  Copyright © 2020 Erik Tollefsrud. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseUrl = "https://api.hearthstonejson.com/v1/latest/enUS/cards.collectible.json"
    let cache           = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getCards(completed: @escaping (Result<[HSCard], HSJSONError>) -> Void) {
        
        guard let url = URL(string: baseUrl) else {
            completed(Result.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(Result.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(Result.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(Result.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let cards = try decoder.decode(HSCards.self, from: data)
                completed(Result.success(cards))
            } catch {
                print(error)
                completed(Result.failure(.invalidData))
            }
        }
        task.resume()
    }
}
