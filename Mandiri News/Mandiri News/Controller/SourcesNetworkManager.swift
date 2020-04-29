//
//  NewsManager.swift
//  Mandiri News
//
//  Created by Helmi on 27/04/20.
//  Copyright © 2020 Helmi. All rights reserved.
//

import Foundation

class SourcesNetworkManager: ObservableObject {
    
    var baseURL: String = "https://newsapi.org/v2/sources?apiKey=105a99217ff743efb5a583950355de19&category="
    
    typealias Element = PostSource
    @Published var posts = [PostSource]()

    
    //Fetch data from the API with the query
    func fetchData(chosenCategory: String) {
        baseURL = "\(baseURL)\(chosenCategory)"
        
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(SourceResults.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.sources
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
    
    
    
    
    
    /* Code still under development -------------------
     
     
      //var startIndex: Int {posts.startIndex}
      //var endIndex: Int {posts.endIndex}
      //var currentlyLoading = false
      //var start = 0
      //var urlCategory = ""
      //var loadStatus = LoadStatus.ready(nextPage: 1)
     
    init() {
        loadMoreArticles()
    }
    
    subscript(position: Int) -> PostSource {
        return posts[position]
    }
    
 
    
    func shouldLoadMoreData(currentItem: PostSource? = nil) -> Bool {
        guard let currentItem = currentItem else {
            return true
        }
        
        for n in (posts.count - 4)...(posts.count-1) {
            if n >= 0 && currentItem.uuid == posts[n].uuid {
                return true
            }
        }
        return false
    }
    func loadMoreArticles(currentItem: PostSource! = nil) {
         
         if !shouldLoadMoreData(currentItem: currentItem) {
             return
         }
         guard case let .ready(page) = loadStatus else {
             return
         }
         loadStatus = .loading(page: page)
         let urlString = "\(urlCategory)\(page)"
         
         let url = URL(string: urlString)!
         let task = URLSession.shared.dataTask(with: url, completionHandler: parseArticlesFromResponse(data:response:error:))
         task.resume()
     }
    
    func parseArticlesFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            loadStatus = .parseError
            return
        }
        guard let data = data else {
            print("No data found")
            loadStatus = .parseError
            return
        }
        
        let newArticles = parseArticlesFromData(data: data)
        DispatchQueue.main.async {
            self.posts.append(contentsOf: newArticles)
            if newArticles.count == 0 {
                self.loadStatus = .done
            } else {
                guard case let .loading(page) = self.loadStatus else {
                    fatalError("loadSatus fatal error")
                }
                self.loadStatus = .ready(nextPage: page + 1)
            }
        }
    }
    
    func parseArticlesFromData(data: Data) -> [PostSource] {
        var response: NewsApiResponse
        do {
            response = try JSONDecoder().decode(NewsApiResponse.self, from: data)
        } catch {
            print("JSON parsing error: \(error)")
            return []
        }
        
        if response.status != "ok" {
            print("Status is not ok: \(response.status)")
            return []
        }
        
        return response.articles ?? []
    }
    
    
    enum LoadStatus {
        case ready (nextPage: Int)
        case loading (page: Int)
        case parseError
        case done
    }
    
    class NewsApiResponse: Codable {
        var status: String
        var articles: [PostSource]?
    }

    enum CodingKeys: String, CodingKey {
        case author, title, urlToImage
    }
 */
}
