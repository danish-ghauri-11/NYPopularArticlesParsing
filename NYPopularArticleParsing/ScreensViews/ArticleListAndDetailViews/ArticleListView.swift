//
//  ContentView.swift
//  NYPopularArticleParsing
//
//  Created by Danish Ghauri on 10/05/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var articleListViewModelObserver:ArticleListViewModelController
    
    var body: some View {
        
        ZStack{
            
            NavigationView {
                
                List (articleListViewModelObserver.popularArticles) {article in
                    NavigationLink(destination:ArticleDetailView(article: article)){
                        ArticleListRow(article: article)
                    }
                    
                }
                .navigationBarTitle(Text("Popular Articles"))
            }
            .disabled(self.articleListViewModelObserver.isApiCall)
            .blur(radius: self.articleListViewModelObserver.isApiCall ? 5 : 0)
            
            if self.articleListViewModelObserver.isApiCall == true {
                LoaderView(loadingText: "Fetching Articles...")
            }
            if self.articleListViewModelObserver.popularArticles.count == 0{
                
                Button(action: {
                    self.articleListViewModelObserver.fetchPopularArticles()
                }) {
                Text("Retry")
                    .font(Font.system(size: 16.0, weight: .bold))
                }
            }
        }
        .alert(isPresented: self.$articleListViewModelObserver.isError) {
                Alert(title: Text("Error!"), message: Text(articleListViewModelObserver.errorText), dismissButton: .default(Text("OK")))
            
        }
        .onAppear(perform: {
            self.articleListViewModelObserver.fetchPopularArticles()
        })
            .frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 0.0, maxHeight: .infinity, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
