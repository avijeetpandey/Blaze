//
//  BlazeNetworkManager.swift
//  Blaze
//
//  Created by Avijeet on 28/04/24.
//

import Foundation

// MARK: - BlazeNetworkManager
public class BlazeNetworkManager: BlazeNetworkProtocol {
    
    internal var _baseURL: String?
    internal var _authorizationToken: String?
    internal var _headers = [String: String]()
    internal var _task: URLSessionDataTask?
    
    static let shared = BlazeNetworkManager()
    
    // MARK: - Init
    private init() { }
    
    // MARK: - base function to send network request
    internal func sendRequest<T>(with networkObject: any BlazeNetworkRequestObjectProtocol,
                                 completion: @escaping (Result<T, BlazeNetworkError>) -> Void) where T : Decodable, T : Encodable {
        
        // in case if the URL is not a valid one
        guard let baseUrl = _baseURL else {
            completion(.failure(.invalidURL))
            return
        }
        
        let completeUrl = "\(baseUrl)/\(networkObject.url)"
        
        guard let url = URL(string: completeUrl) else {
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
        
        _task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error  {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            // checking for a valid response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            // extracting data from the url response body
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            // decoding data
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch(let error) {
                completion(.failure(.decodingFailed(error)))
            }
        }
        
        _task?.resume()
    }
    
    // MARK: - GET call
    func get<T: Codable>(endPoint: String,
                         completion: @escaping (Result<T, BlazeNetworkError>) -> Void) {
        let networkRequestObject: BlazeNetworkRequestObject = .init(url: endPoint, method: .get)
        self.sendRequest(with: networkRequestObject, completion: completion)
    }
    
    // MARK: - POST call
    func post<T: Codable>(endPoint: String,
                          data: [String: Any],
                          completion: @escaping (Result<T, BlazeNetworkError>) -> Void) {
        
        let jsonData = try? JSONSerialization.data(withJSONObject: data)
        
        let networkRequestObject: BlazeNetworkRequestObject = .init(url: endPoint, method: .post, body: jsonData)
        self.sendRequest(with: networkRequestObject, completion: completion)
    }
    
    func put<T: Codable>(endPoint: String,
                         data: [String: Any],
                         completion: @escaping (Result<T, BlazeNetworkError>) -> Void) {
        
        let jsonData = try? JSONSerialization.data(withJSONObject: data)
        
        let networkRequestObject: BlazeNetworkRequestObject = .init(url: endPoint, method: .put, body: jsonData)
        self.sendRequest(with: networkRequestObject, completion: completion)
    }
}

