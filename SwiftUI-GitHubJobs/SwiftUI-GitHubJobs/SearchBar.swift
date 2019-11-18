//
//  SearchBar.swift
//  SwiftUI-GitHubJobs
//
//  Created by Adam Chin on 11/16/19.
//  Copyright © 2019 Adam Chin. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
  @Binding var text: String
  @State var action: () -> Void
  
    var body: some View {
      ZStack {
        Color.blue
        HStack{
          TextField("Search Jobs", text: $text)
            .padding([.leading, .trailing], 8)
            .frame(height: 32)
            .background(Color.white.opacity(0.4))
            .cornerRadius(8)
          
          Button(action: action, label: { Text("Search") })
            .foregroundColor(Color.white)
          
        }.padding([.leading, .trailing], 16)
      }.frame(height:64)
    }
}

