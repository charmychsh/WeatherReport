//
//  WeatherReportTests.swift
//  WeatherReportTests
//
//  Created by Charmy Shah on 3/10/19.
//  Copyright © 2019 charmy. All rights reserved.
//

import XCTest
@testable import WeatherReport

class WeatherReportTests: XCTestCase {

    override func setUp() {
      /*  let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        rootViewController = navigationController.viewControllers[0]
        _ = rootViewController.view*/
        
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
    
    func test_weather_view_title_is_correct() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers[0]
        let _ = rootViewController.view
      //  XCTAssertEqual("Weather", rootViewController.title!)
    }
    
    func test_weather_view_has_label() {
        
        var weather = Weather(json: <#[String : Any]#>)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
