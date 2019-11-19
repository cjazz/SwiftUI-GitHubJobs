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
    var positions: [Position] = []
  
    override func setUp() {
      // load positions from json file

      positions = Bundle.main.decode([Position].self, from: "githubJobs.json")

    }

  func testModelNotEmpty() throws {
    
    if !positions.isEmpty {
          try positions.forEach {
            
            let id = try XCTUnwrap($0.id)
            XCTAssertFalse(id.isEmpty)
            
            let title = try XCTUnwrap($0.title)
            XCTAssertFalse(title.isEmpty)
            
            let type = try XCTUnwrap($0.type)
            XCTAssertFalse(type.isEmpty)
            
            let company = try XCTUnwrap($0.company)
            XCTAssertFalse(company.isEmpty)
    
            let url = try XCTUnwrap($0.url)
            XCTAssertFalse(url.isEmpty)
            
            let location = try XCTUnwrap($0.location)
            XCTAssertFalse(location.isEmpty)
          }
      }
  }
  
    override func tearDown() {
      positions.removeAll()
      
    }

}
