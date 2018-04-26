//
//  OmniDeckBuilderTests.swift
//  OmniDeckBuilderTests
//
//  Created by Richard Crichlow on 4/17/18.
//  Copyright © 2018 Richard Crichlow. All rights reserved.
//

import XCTest
@testable import OmniDeckBuilder

class OmniDeckBuilderTests: XCTestCase {
    
    func testJobAPIConnection() {
        let cardResultsExpectation = XCTestExpectation(description: "Card results exist")
        //start network request
        var cards = [Card]()
        //JobsAPIClient.manager.getAllOnlineJobs(completionHandler: { cards = $0 ; cardResultsExpectation.fulfill()}, errorHandler: {print($0)})
        CardAPIClient.manager.getCards(matching: "Goblin", completionHandler: { cards = $0 ; cardResultsExpectation.fulfill()}, errorHandler: {print($0)})
        //wait 10 seconds for results because it's async
        wait(for: [cardResultsExpectation], timeout: 10)
        XCTAssertGreaterThan(cards.count, 0, "Cards are coming back from MTG Online")
    }
    
}
