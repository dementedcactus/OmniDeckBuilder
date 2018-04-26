//
//  Card.swift
//  OmniDeckBuilder
//
//  Created by Richard Crichlow on 4/26/18.
//  Copyright © 2018 Richard Crichlow. All rights reserved.
//

import Foundation

struct ResultsWrapper: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let name: String?
    let names: [String]?
    let manaCost: String?
    let cmc: Int?
    let colors: [Color]?
    let colorIdentity: [ColorIdentity]?
    let type: String?
    let types: [String]?
    let supertypes: [String]?
    let subtypes: [String]?
    
    let rarity: String?
    let set: String?
    let setName: String?
    let text: String?
    let artist: String?
    let power: String?
    let toughness: String?
    let layout: Layout?
    
    let multiverseid: Int?
    let imageUrl: String?
    let rulings: [Ruling]?
    let flavor: String?
    let number: String?
    let watermark: String?
    
    let legalities: [LegalityElement]?
    let id: String?
    let source: String?
    let border: String?
    let variations: [Int]?
    let reserved: Bool?
    let starter: Bool?
    let loyalty: Int?
    let releaseDate: String?
}

enum ColorIdentity: String, Codable {
    case b = "B"
    case r = "R"
    case u = "U"
    case w = "W"
    case g = "G"
}

enum Color: String, Codable {
    case black = "Black"
    case blue = "Blue"
    case red = "Red"
    case white = "White"
    case green = "Green"
}

struct LegalityElement: Codable {
    let format: Format?
    let legality: LegalityEnum?
}
enum LegalityEnum: String, Codable {
    case legal = "Legal"
}

enum Format: String, Codable {
    case commander = "Commander"
    case innistradBlock = "Innistrad Block"
    case legacy = "Legacy"
    case lorwynShadowmoorBlock = "Lorwyn-Shadowmoor Block"
    case modern = "Modern"
    case standard = "Standard"
    case vintage = "Vintage"
    case amonkhetBlock = "Amonkhet Block"
    case battleForZendikarBlock = "Battle for Zendikar Block"
    case iceAgeBlock = "Ice Age Block"
    case invasionBlock = "Invasion Block"
    case ixalanBlock = "Ixalan Block"
    case kaladeshBlock = "Kaladesh Block"
    case kamigawaBlock = "Kamigawa Block"
    case khansOfTarkirBlock = "Khans of Tarkir Block"
    case masquesBlock = "Masques Block"
    case mirageBlock = "Mirage Block"
    case mirrodinBlock = "Mirrodin Block"
    case odysseyBlock = "Odyssey Block"
    case onslaughtBlock = "Onslaught Block"
    case ravnicaBlock = "Ravnica Block"
    case returnToRavnicaBlock = "Return to Ravnica Block"
    case scarsOfMirrodinBlock = "Scars of Mirrodin Block"
    case shadowsOverInnistradBlock = "Shadows over Innistrad Block"
    case shardsOfAlaraBlock = "Shards of Alara Block"
    case tempestBlock = "Tempest Block"
    case therosBlock = "Theros Block"
    case timeSpiralBlock = "Time Spiral Block"
    case unSets = "Un-Sets"
    case urzaBlock = "Urza Block"
    case zendikarBlock = "Zendikar Block"
}

enum Layout: String, Codable {
    case normal = "normal"
    case token = "token"
    case plane = "plane"
    case doubleFaced = "double-faced"
    case split = "split"
}

enum Rarity: String, Codable {
    case common = "Common"
    case mythicRare = "Mythic Rare"
    case rare = "Rare"
    case special = "Special"
    case uncommon = "Uncommon"
}

struct Ruling: Codable {
    let date, text: String?
}

struct CardAPIClient {
    private init() {}
    static let manager = CardAPIClient()
    private let urlStr = "https://api.magicthegathering.io/v1/cards?name="
    func getCards(matching searchTerm: String,
                  completionHandler: @escaping ([Card]) -> Void,
                  errorHandler: @escaping (Error) -> Void) {
        guard let formattedSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed) else {
            errorHandler(AppError.badURL(url: searchTerm))
            return
        }
        let fullUrlStr = urlStr + formattedSearchTerm
        guard let url = URL(string: fullUrlStr) else {
            errorHandler(AppError.badURL(url: fullUrlStr))
            return
        }
        let request = URLRequest(url: url)
        let parseDataIntoCards: (Data) -> Void = {(data) in
            do {
                let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                let cards = results.cards
                completionHandler(cards)
            }
            catch {
                errorHandler(AppError.codingError(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: parseDataIntoCards, errorHandler: errorHandler)
    }
}
