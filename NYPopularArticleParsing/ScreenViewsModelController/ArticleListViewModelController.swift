//
//  ArticleListViewModelObserver.swift
//  NYPopularArticleParsing
//
//  Created by Danish Ghauri on 10/05/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import Foundation


class ArticleListViewModelController: ObservableObject {

    @Published var popularArticles:[ArticleModel] = []
    @Published var isApiCall:Bool = false
    @Published var isError:Bool = false
    @Published var errorText:String = ""
    
    func fetchPopularArticles(withDays:Int = 1) {
        
        if Connectivity.isConnectedToInternet == false{
            
            self.isError = true
            self.errorText = "You appeared to be offline. Check your internet."
            return
        }
        isApiCall = true
        UWebServicesManager.sharedInstance.getRequestForData(params: nil , service:"\(withDays).json?api-key=\(nyAppApiKey)"){ jsonData,errorStr,responseCode   in
                   
            self.isApiCall = false
            if responseCode == 200 {
                if jsonData != nil {
                    
                    let response = loadJSON(jsonData!) as ResponseModel
                    
                    if response.results != nil{
                        self.popularArticles = response.results!
                    }
                    else{
                        self.isError = true
                        self.errorText = errorStr ?? ""
                    }
                }
            }
            else{
               
                let errorModel = loadJSON(jsonData!) as ErrorModel
                self.isError = true
                self.errorText = (errorModel.fault?.faultstring)!
            }
                   
        }
    }
}
