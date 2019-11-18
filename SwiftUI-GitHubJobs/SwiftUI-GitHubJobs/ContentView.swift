//
//  ContentView.swift
//  SwiftUI-GitHubJobs
//
//  Created by Adam Chin on 11/16/19.
//  Copyright © 2019 Adam Chin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = SearchJobsViewModel()
  
  var body: some View {
    
    NavigationView {
      
      VStack {
        
        SearchBar(text: $viewModel.jobName) {
          self.viewModel.searchJobs()
        }
        List(viewModel.jobs) { job in
          JobRow(viewModel: self.viewModel, job: job)
        }.accentColor(.gray)
        
      }.navigationBarTitle("Search Github Jobs")
    }
    
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

