//
//  VegetablesRepository.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 23/02/25.
//

import Foundation

final class VegetablesRepository: DefaultConnector {
    
    public static let shared = VegetablesRepository()
    
    private override init() {}
    
    public func fetchVegeatbles()  async throws -> Data {
      let apiResponse =  try await request(url: Constants.vegetablesUrl)
      return apiResponse
    }
}
