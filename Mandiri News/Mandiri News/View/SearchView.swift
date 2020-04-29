//
//  SearchView.swift
//  Mandiri News
//
//  Created by Helmi on 29/04/20.
//  Copyright © 2020 Helmi. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText : String = ""
    @State var selection: Int? = nil
    
    var body: some View {
        ZStack{
            
                Color(red: 0.17, green: 0.24, blue: 0.31, opacity: 1)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                SearchBar(text: $searchText, placeholder: "Search News")
                NavigationLink(destination: SearchResult(keyword: searchText), tag: 1, selection: $selection){
                    Button(action: {
                        self.selection = 1
                    }) {
                        HStack {
                            Text("Search")
                                
                                .font(.system(size: 15))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                        }
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
