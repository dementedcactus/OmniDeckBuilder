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
    let text: String?
    let imageURL: String?
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
