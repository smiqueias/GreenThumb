//
//  Vegetable.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 23/02/25.
//

//   let vegetable = try? JSONDecoder().decode(Vegetable.self, from: jsonData)

import Foundation

// MARK: - VegetableElement
struct Vegetable: Codable {
    public let vegetableID: Int
    public let vegetableCode: String
    public let catalogID: Int
    public let name, description: String
    public let thumbnailImage: String
    public let seedDepth, germinationSoilTemp: String
    public let daysToGermination: Int
    public let sowIndoors, sowOutdoors, phRange, growingSoilTemp: String
    public let spacingBeds, watering: String
    public let light: String
    public let goodCompanions, badCompanions, sowingDescription, growingDescription: String
    public let harvestDescription: String
    public let active: Bool?
    public let season: String
    public let daysToHarvestSeeds, daysToHarvestSeedlings: Int
    public let healthBenefits: String
    public let pests: [Pest]

    enum CodingKeys: String, CodingKey {
        case vegetableID = "VegetableId"
        case vegetableCode = "VegetableCode"
        case catalogID = "CatalogId"
        case name = "Name"
        case description = "Description"
        case thumbnailImage = "ThumbnailImage"
        case seedDepth = "SeedDepth"
        case germinationSoilTemp = "GerminationSoilTemp"
        case daysToGermination = "DaysToGermination"
        case sowIndoors = "SowIndoors"
        case sowOutdoors = "SowOutdoors"
        case phRange = "PhRange"
        case growingSoilTemp = "GrowingSoilTemp"
        case spacingBeds = "SpacingBeds"
        case watering = "Watering"
        case light = "Light"
        case goodCompanions = "GoodCompanions"
        case badCompanions = "BadCompanions"
        case sowingDescription = "SowingDescription"
        case growingDescription = "GrowingDescription"
        case harvestDescription = "HarvestDescription"
        case active = "Active"
        case season = "Season"
        case daysToHarvestSeeds = "DaysToHarvestSeeds"
        case daysToHarvestSeedlings = "DaysToHarvestSeedlings"
        case healthBenefits = "HealthBenefits"
        case pests = "Pests"
    }
}


// MARK: - Pest
struct Pest: Codable {
    let name, description, symptoms, treatment: String
    let photo: String
}
