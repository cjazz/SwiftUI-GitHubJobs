//
//  SwiftUI_GitHubJobsTests.swift
//  SwiftUI-GitHubJobsTests
//
//  Created by Adam Chin on 11/18/19.
//  Copyright © 2019 Adam Chin. All rights reserved.
//

import XCTest
@testable import SwiftUI_GitHubJobs

class SwiftUI_GitHubJobsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

  func testModelNotEmpty() throws {
    let position1 = Position(id: "123", type: "sdf", url: "sdf", company: "sdf", location: "sdf", title: "sfd")
    
    let url = try XCTUnwrap(position1.url)
    XCTAssertFalse(url.isEmpty)
  }
  
    override func tearDown() {
      
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
