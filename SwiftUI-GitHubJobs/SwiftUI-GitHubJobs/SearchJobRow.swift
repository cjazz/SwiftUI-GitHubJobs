//
//  SearchJobRow.swift
//  SwiftUI-GitHubJobs
//
//  Created by Adam Chin on 11/16/19.
//  Copyright © 2019 Adam Chin. All rights reserved.
//

import SwiftUI

struct JobRow: View {
  @ObservedObject var viewModel: SearchJobsViewModel
  @State var job: Position
  
  var body: some View {
    HStack {
    
      Text(job.title)
        .font(Font.system(.caption))
      Text(job.id)
        .font(Font.system(.footnote))
      
    }.frame(height:44)
  }
}
