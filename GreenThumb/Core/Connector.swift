//
//  Connector.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 23/02/25.
//

import Foundation

public protocol Connector {
    func request(url: String) async throws -> Data
}

class DefaultConnector: Connector {
    func request(url: String) async throws -> Data {
        
        guard let urlRequest = URL(string: url) else {
            throw NSError(domain: "Invalid URL", code: 0)
        }
        
        let (data, _) = try await URLSession.shared.data(from: urlRequest)
        
        return data
    }
}
