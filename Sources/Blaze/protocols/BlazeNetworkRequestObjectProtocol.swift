//
//  BlazeNetworkRequestObjectProtocol.swift
//  Blaze
//
//  Created by Avijeet on 28/04/24.
//

import Foundation

// MARK: - BlazeNetworkRequestProtocol
public protocol BlazeNetworkRequestObjectProtocol {
    var url: String { get }
    var method: HttpMethods { get }
    var body: Data? { get }
}
