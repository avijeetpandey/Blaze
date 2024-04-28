//
//  BlazeNetworkProtocol.swift
//  Blaze
//
//  Created by Avijeet on 28/04/24.
//

import Foundation

// MARK: - BlazeNetworkProtocol
protocol BlazeNetworkProtocol {
    func sendRequest<T: Codable>(with networkObject: BlazeNetworkRequestObjectProtocol,
                                 completion: @escaping (Result<T,BlazeNetworkError>) -> Void)
}

public protocol BlazeAuthorizationProtocol {
    func setDefaultHeaders(with headers: [String: String])
    func setAuthorization(with token: String)
    mutating func appendHeader(key: String, value: String)
}
