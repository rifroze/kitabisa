//
//  SempoaaUITests.swift
//  SempoaaUITests
//
//  Created by Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import XCTest

class SempoaaUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testDisplayingOutput() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element(boundBy: 0)
        element.children(matching: .textField).element(boundBy: 0).tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        element.children(matching: .textField).element(boundBy: 1).tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        
        let key4 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.buttons["Calculate"].tap()
        
        let textView = element2.children(matching: .other).element(boundBy: 1).children(matching: .textView).element
        XCTAssertEqual(textView.value as! String, "39", "Test output content with first cell")
    }
    
    func testSwipeCards() {        
        let element = app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.swipeLeft()
        element.tap()
        
        let element3 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element2 = element3.children(matching: .other).element(boundBy: 0)
        element2.children(matching: .textField).element(boundBy: 0).tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        element2.children(matching: .textField).element(boundBy: 1).tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.buttons["Calculate"].tap()
        let textView = element3.children(matching: .other).element(boundBy: 1).children(matching: .textView).element
        XCTAssertEqual(textView.value as! String, "90", "Test output content after swipe left with and choose second cell")
    }

}
