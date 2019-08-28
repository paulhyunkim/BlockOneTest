//
//  APIClient.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import Foundation

class APIClient: APIClientProtocol {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func fetchBlockchainInfo(_ completion: @escaping (APIResponse<BlockchainInfo>) -> Void) {
        let url = URL(string: "https://api.eosnewyork.io/v1/chain/get_info")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        sendRequest(urlRequest, completion: completion)
    }
    
    func fetchBlock(id: String, _ completion: @escaping (APIResponse<Block>) -> Void) {
        let url = URL(string: "https://api.eosnewyork.io/v1/chain/get_block")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let parameterDictionary = ["block_num_or_id": id]
        do {
            let httpBody = try JSONSerialization.data(withJSONObject: parameterDictionary, options: [])
            urlRequest.httpBody = httpBody
        } catch let error {
            return completion(.failure(error: error))
        }
        
        sendRequest(urlRequest, completion: completion)
    }
    
    private func sendRequest<T: Decodable>(_ urlRequest: URLRequest, completion: @escaping (APIResponse<T>) -> Void) {
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                let error = NSError(domain: "No data was received in data task", code: 0, userInfo: nil)
                completion(.failure(error: error))
                return
            }
            do {
                let decodedObject: T = try self.decodeData(data)
                completion(.success(result: decodedObject))
            } catch let error {
                completion(.failure(error: error))
            }
            
        }
        dataTask.resume()
    }
    
    private func decodeData<T: Decodable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch let error {
            throw error
        }
    }
    
}
