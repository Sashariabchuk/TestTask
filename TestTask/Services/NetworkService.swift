//
//  NetworkService.swift
//  TestTask
//
//  Created by Sasha Riabchuk on 30.12.2021.
//

import Foundation

class NetworkService {
    
    static var shared = NetworkService()
    
    func fetchData<T: Codable>(url: String, completion: @escaping (Result<[T], Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode([T].self, from: data)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
