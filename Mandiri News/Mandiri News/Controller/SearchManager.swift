//
//  SearchManager.swift
//  Mandiri News
//
//  Created by Helmi on 29/04/20.
//  Copyright © 2020 Helmi. All rights reserved.
//

import Foundation

//


class SearchManager: ObservableObject {
    
    var baseURL: String = "https://newsapi.org/v2/everything?apiKey=105a99217ff743efb5a583950355de19&q="
    
    
    @Published var posts = [ArticlePost]()
    
    
    func fetchData(searchString: String) {
        
        //Removing white spaces for multiple words in search func
        baseURL = "\(baseURL)\(searchString.replacingOccurrences(of: " ", with: "+"))"
        print(searchString)
        print(baseURL)
        
        
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(ArticleResults.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.articles
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}


