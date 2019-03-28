//
//  SempoaaTests.swift
//  SempoaaTests
//
//  Created by Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import XCTest
@testable import Sempoaa

class SempoaaTests: XCTestCase {
    
    var detailInteractor: DetailInteractorProtocol!

    override func setUp() {
        self.detailInteractor = DetailInteractor()
    }

    func testSumOperation() {
        let value = self.detailInteractor.sum(first: 26, second: 5)
        XCTAssertEqual(value, "31", "Sum operation")
    }
    
    func testMultipicationOperation() {
        let value = self.detailInteractor.multiply(first: 3, second: 7)
        XCTAssertEqual(value, "21", "Multiplication operation")
    }
    
    func testFirstPrimeGenerator() {
        let value = self.detailInteractor.prime(first: 15)
        XCTAssertEqual(value, "2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47", "First Prime Generator")
    }
    
    func testFirstFiboGenerator() {
        let value = self.detailInteractor.fibonacci(first: 14)
        XCTAssertEqual(value, "0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233", "First Fibo Generator")
    }

}
