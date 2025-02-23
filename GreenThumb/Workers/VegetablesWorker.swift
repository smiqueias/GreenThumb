//
//  VegetablesWorker.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 23/02/25.
//

import Foundation

final class VegetablesWorker {
    
    private let vegetablesRepository: VegetablesRepository
    private let decoder: JSONDecoder
    
    init(vegetablesRepository: VegetablesRepository, decoder: JSONDecoder) {
        self.vegetablesRepository = vegetablesRepository
        self.decoder = decoder
    }
    
    func fetchVegeatbles(
        completion: @escaping (Result<[Vegetable], Error>) -> Void
    ) async -> Void {
        do {
            let data = try await self.vegetablesRepository.fetchVegeatbles()
            let vegetables = try self.decoder.decode([Vegetable].self, from: data)
            completion(.success(vegetables))
        } catch {
            completion(.failure(error))
        }
    }
}
