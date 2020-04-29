//
//  SearchResult.swift
//  Mandiri News
//
//  Created by Helmi on 29/04/20.
//  Copyright © 2020 Helmi. All rights reserved.
//

import SwiftUI

struct SearchResult: View {
    @ObservedObject var searchManager = SearchManager()
    
    let keyword: String?
    
    var body: some View {
        
        List(searchManager.posts) { post in
            NavigationLink(destination: DetailView(url: post.url)) {
                VStack (alignment: .leading) {
                    
                    Text(post.title!).font(.headline)
                    
                    if post.author == nil {
                        Text("No Author").font(.subheadline)
                    }else{
                        Text(post.author!).font(.subheadline)
                    }
                }
            }
            .navigationBarTitle("Search Result")
        }
        .onAppear {
            self.searchManager.fetchData(searchString: self.keyword!)
            
        }
        
    }
}

struct SearchResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchResult(keyword: "Trump")
    }
}
