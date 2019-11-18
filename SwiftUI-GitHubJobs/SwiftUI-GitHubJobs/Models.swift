//
//  Models.swift
//  SwiftUI-GitHubJobs
//
//  Created by Adam Chin on 11/16/19.
//  Copyright © 2019 Adam Chin. All rights reserved.
//

import Foundation
import SwiftUI

struct Position: Codable,Identifiable {
  let id: String
  let type: String
  let url: String
  let company: String
  let location: String
  let title: String
}
