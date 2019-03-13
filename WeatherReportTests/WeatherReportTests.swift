//
//  WeatherReportTests.swift
//  WeatherReportTests
//
//  Created by Charmy Shah on 3/10/19.
//  Copyright © 2019 charmy. All rights reserved.
//

import XCTest
import CoreLocation
@testable import WeatherReport

class WeatherReportTests: XCTestCase {

    override func setUp() {
        
    }
        
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_first_view_is_weather() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers[0]
        XCTAssertTrue(rootViewController is WeatherTableViewController)
    }
    
    func test_first_view_is_weather_is_visible() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers[0]
        XCTAssertNotNil(rootViewController.view)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
