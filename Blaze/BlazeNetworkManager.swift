//
//  BlazeNetworkManager.swift
//  Blaze
//
//  Created by Avijeet on 28/04/24.
//

import Foundation

public class BlazeNetworkManager: BlazeNetworkProtocol {
    
    internal var _baseURL: String?
    internal var _authorizationToken: String?
    internal var _headers = [String: String]()
    
    static let shared = BlazeNetworkManager()

    // MARK: - Init
    private init() { }
    
    internal func sendRequest<T>(with networkObject: any BlazeNetworkRequestObjectProtocol, completion: @escaping (Result<T, BlazeNetworkError>) -> Void) where T : Decodable, T : Encodable {
        
        // in case if the URL is not a valid one
        guard let url = URL(string: networkObject.url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        // creating url request
        var request = URLRequest(url: url)
        
        // appending headers to the request
        _headers.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        request.httpMethod = networkObject.method.rawValue
        request.httpBody = networkObject.body
        
    }
}

