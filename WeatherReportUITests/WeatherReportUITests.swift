//
//  WeatherReportUITests.swift
//  WeatherReportUITests
//
//  Created by Charmy Shah on 3/10/19.
//  Copyright © 2019 charmy. All rights reserved.
//

import XCTest

class WeatherReportUITests: XCTestCase {

    let app = XCUIApplication()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        print(app.debugDescription)
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        print(app.debugDescription)
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testToCheckTableViewSwipeIsWorkingFine() {
        let tablesQuery = app.tables
        let tableElement = tablesQuery.element
        tableElement.swipeUp()
    }
    
    func testToCheckTableViewCellsAreVisible() {
        let tablesQuery = app.tables
      //  let cellQuery = tablesQuery.cells.containing(.staticText, identifier: "Cell")
        let count = tablesQuery.cells.count
        XCTAssert(count > 0)
    }

    func testToasdaCheckTableViewCellsAreVisible() {

        let table = app.tables.element
    
        let cell = table.cells.element(boundBy: 2)
        let image = cell.children(matching: .image)
       XCTAssertNotNil(image)
    }
    
    func testToCheckTitle() {
        
        let title = app.label
        XCTAssertEqual("WeatherReport", title)
    }
    
    func testToCheckNavigationBarExist() {
        
        let navigations = app.navigationBars.matching(identifier: "Weather")
        XCTAssertNotNil(navigations)
    }
    
    
    func testToCheckSearchBarExist() {
        
        let searchBar = app.searchFields.matching(identifier: "search-bar")
        XCTAssertNotNil(searchBar)
    }
    
    func testToCheckImageForCellExist() {
        let tablesQuery = app.tables
        //  let cellQuery = tablesQuery.cells.containing(.staticText, identifier: "Cell")
        let cell = tablesQuery.cells.element(boundBy: 1)
        XCTAssertTrue(cell.isHittable)
    }
}
