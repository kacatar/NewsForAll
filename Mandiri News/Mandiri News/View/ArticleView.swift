//
//  ArticleView.swift
//  Mandiri News
//
//  Created by Helmi on 28/04/20.
//  Copyright © 2020 Helmi. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    
    @ObservedObject var articleNetworkManager = ArticleNetworkManager()
    
    let id: String?
    
    var body: some View {
        List(articleNetworkManager.posts) { post in
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
        }
        .navigationBarTitle("News")
        .onAppear {
            self.articleNetworkManager.fetchData(choosenID: self.id!)
            
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(id: "aftenposten")
    }
}
