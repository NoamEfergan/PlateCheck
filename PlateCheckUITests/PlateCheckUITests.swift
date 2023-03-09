//
//  PlateCheckUITests.swift
//  PlateCheckUITests
//
//  Created by Noam Efergan on 06/03/2023.
//

import XCTest
@testable import PlateCheck

final class PlateCheckUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        setupSnapshot(app)
        app.launch()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

        func testInitial() {
            let app = XCUIApplication()
            app.textFields["Enter plate number"].tap()
            
            let aKey = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            aKey.tap()
            aKey.tap()
            
            let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
            moreKey.tap()
            
            let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key.tap()
            
            let key2 = app/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key2.tap()
            moreKey.tap()
            aKey.tap()
            aKey.tap()
            aKey.tap()
            app.toolbars["Toolbar"].buttons["Done"].tap()
            app.buttons["Submit"].tap()
    }
}
