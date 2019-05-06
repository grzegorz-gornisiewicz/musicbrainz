//
//  MusicWhereToTests.swift
//  MusicWhereToTests
//
//  Created by Grzegorz Górnisiewicz on 30.04.2019.
//  Copyright © 2019 Long Road. All rights reserved.
//

import XCTest
@testable import MusicWhereTo

class MusicWhereToTests: XCTestCase {
    var req: PlacesRequest?
    
    override func setUp() {
        super.setUp()
        req = PlacesRequest()
    }
    
    override func tearDown() {
        req = nil
        super.tearDown()
    }
    
    func testGettingJazzPlaces() {
        let expectation = XCTestExpectation(description: "Test getting Jazz places")
        
        req?.find("Jazz") { (places, _) in
            XCTAssert(places.count > 0)
            XCTAssert(places.count <= 20)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 15.0)
    }
    
    func testGettingRockPlaces() {
        let expectation = XCTestExpectation(description: "Test getting Rock places")
        
        req?.find("Rock", 1) { (places, _) in
            XCTAssert(places.count == 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 15.0)
    }
    
    func testGettingGrungePlaces() {
        let expectation = XCTestExpectation(description: "Test getting Warsaw places")
        
        req?.find("Warsaw", 0) { (places, _) in
            XCTAssert(places.count > 20)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 15.0)
    }
}
