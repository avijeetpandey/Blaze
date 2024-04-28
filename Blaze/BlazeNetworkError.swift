//
//  BlazeNetworkError.swift
//  Blaze
//
//  Created by Avijeet on 28/04/24.
//

import Foundation

public enum BlazeNetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
}
