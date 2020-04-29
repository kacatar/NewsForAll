//
//  ContentView.swift
//  Mandiri News
//
//  Created by Helmi on 27/04/20.
//  Copyright © 2020 Helmi. All rights reserved.
//  Standing on shoulders of giants

import SwiftUI

//target and behavior
struct ContentView: View {
    
    //category that the NewsAPI provided to search
    var category = ["business", "entertainment", "health", "general", "science", "sport", "technology"]
    
    
    @State private var selectedCategory = 3
    @State var selection: Int? = nil
    
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Color(red: 0.17, green: 0.24, blue: 0.31, opacity: 0.95)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Text("#NewsForAll")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Image("NewsIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0, height: 100.0)
                        .colorInvert()
                    
                    Divider()
                    Divider()
                    
                    Text("Pick a category:")
                        .foregroundColor(.white)
                        .padding(.bottom, -8.0)
                    Picker("", selection: $selectedCategory) {
                        ForEach(0 ..< category.count) {
                            Text(self.category[$0])
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 0.0)
                    .labelsHidden()
                    
                    NavigationLink(destination: SourcesListView(selectedCategoryArray: self.$selectedCategory), tag: 1, selection: $selection){
                        Button(action: {
                            self.selection = 1
                        }) {
                            HStack {
                                Text("\t\tSearch\t\t")
                                    
                                    .font(.system(size: 25))
                                    .fontWeight(.heavy)
                                    //.foregroundColor(.init(red: 0.17, green: 0.24, blue: 0.31))
                                    .foregroundColor(.white)
                                    .padding()
                                    .cornerRadius(25)
                                    //.border(Color.white, width: 5)
                                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 5))
                            }
                            
                            //.background(Color.white)
                        }
                        
                    }
                    Divider()
                    Divider()
                    
                    NavigationLink(destination: SearchView(), tag: 2, selection: $selection){
                        Button(action: {
                            self.selection = 2
                        }) {
                            HStack {
                                Text("Search With Keyword")
                                    
                                    .font(.system(size: 15
                                        ))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}


//preview and behavior
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
