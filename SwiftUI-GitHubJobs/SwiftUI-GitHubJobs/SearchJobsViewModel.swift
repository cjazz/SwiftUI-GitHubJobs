//
//  SearchJobsViewModel.swift
//  SwiftUI-GitHubJobs
//
//  Created by Adam Chin on 11/16/19.
//  Copyright © 2019 Adam Chin. All rights reserved.
//

 
import SwiftUI
import Combine

final class SearchJobsViewModel: ObservableObject{

  @Published var jobName = ""
  @Published private(set) var jobs = [Position]()
  let gitHubUser = "cjazz"
  let githubPATToken =  "yourGitHubPatToken"

  private var searchCancellable: Cancellable? {
      didSet { oldValue?.cancel() }
  }
  
  deinit {
        searchCancellable?.cancel()
  }
  
  func searchJobs() {
 
    guard !jobName.isEmpty else { return jobs = [] }
    
    if let newjobName = jobName.lowercased().convertedToSlug() {
      
      let url = URL(string: "https://jobs.github.com/positions.json?search=\(newjobName)")!
         
        var request = URLRequest(url: url)
          let tokenString = gitHubUser + ":\(githubPATToken)"
          request.setValue(tokenString, forHTTPHeaderField: "Authorization")
      
         searchCancellable = URLSession.shared.dataTaskPublisher(for: request)
           .map { $0.data }
           .decode(type: [Position].self, decoder: JSONDecoder())
           .replaceError(with: [])
           .eraseToAnyPublisher()
           .receive(on: RunLoop.main)
           .assign(to: \.jobs, on: self)
    }
  }
}

extension String {
    private static let slugSafeCharacters = CharacterSet(charactersIn: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-")

    public func convertedToSlug() -> String? {
        if let latin = self.applyingTransform(StringTransform("Any-Latin; Latin-ASCII; Lower;"), reverse: false) {
            let urlComponents = latin.components(separatedBy: String.slugSafeCharacters.inverted)
            let result = urlComponents.filter { $0 != "" }.joined(separator: "-")

            if result.count > 0 {
                return result
            }
        }

        return nil
    }
}
