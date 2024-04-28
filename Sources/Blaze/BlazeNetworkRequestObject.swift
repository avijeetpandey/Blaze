//
//  BlazeNetworkRequestObject.swift
//  Blaze
//
//  Created by Avijeet on 28/04/24.
//

import Foundation


// MARK: - BlazeNetworkRequestObject
class BlazeNetworkRequestObject: BlazeNetworkRequestObjectProtocol {
    private (set) var url: String
    private (set) var method: HttpMethods
    private (set) var body: Data?
    
    init(url: String, method: HttpMethods, body: Data? = nil) {
        self.url = url
        self.method = method
        self.body = body
    }
}
