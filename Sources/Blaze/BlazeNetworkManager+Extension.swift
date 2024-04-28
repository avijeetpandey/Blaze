//
//  BlazeNetworkManager+Extension.swift
//  Blaze
//
//  Created by Avijeet on 28/04/24.
//

import Foundation

// MARK: - setting up auth token and headers
extension BlazeNetworkManager: BlazeAuthorizationProtocol {
    public func setDefaultHeaders(with headers: [String : String]) {
        // setting up the default headers for the session
        _headers = headers
    }
    
    public func setAuthorization(with token: String) {
        // setting up auth token can be used for authorization
        _authorizationToken = token
    }
    
    public func appendHeader(key: String, value: String) {
        // setting up extra header if needed
        _headers[key] = value
    }
}

// MARK: - adding functionality to cancel the task
extension BlazeNetworkManager: BlazeNetworkTaskProtocol {
    public func cancelTask() {
        _task?.cancel()
    }
}
