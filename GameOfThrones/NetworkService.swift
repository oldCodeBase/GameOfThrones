//
//  NetworkService.swift
//  GameOfThrones
//
//  Created by Ibragim Akaev on 10/01/2021.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchData(from urlString: String, with complition: @escaping ([Character]) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
            
            do {
                let character = try JSONDecoder().decode([Character].self, from: data)
                complition(character)
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
            
        }.resume()
    }
}
