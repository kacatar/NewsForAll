//
//  NewsListView.swift
//  Mandiri News
//
//  Created by Helmi on 28/04/20.
//  Copyright © 2020 Helmi. All rights reserved.
//

import SwiftUI

struct SourcesListView: View {
    
    var category = ["business", "entertainment", "health", "general", "science", "sport", "technology"]
    
    @ObservedObject var sourceNetworkManager = SourcesNetworkManager()
    @Binding var selectedCategoryArray : Int
    
    var body: some View {
        
        VStack {
            
            List(sourceNetworkManager.posts) { post in
                NavigationLink(destination: ArticleView(id: post.id)) {
                    Text(post.name!)
                }
                .navigationBarTitle("Sources")
            }
           .onAppear {
                self.sourceNetworkManager.fetchData(chosenCategory: self.category[self.selectedCategoryArray])
                print(self.category[self.selectedCategoryArray])
                
            }
        }
    }
}


// Preview is currently under development
//struct SourcesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SourcesListView(selectedCategoryArray)
//    }
//}


