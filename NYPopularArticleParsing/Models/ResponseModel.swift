//
//  ResponseModel.swift
//  NYPopularArticleParsing
//
//  Created by Danish Ghauri on 11/05/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import Foundation

struct ResponseModel: Hashable, Codable {
    
    var status:String?
    var copyright:String?
    var num_results:Int?
    var results:[ArticleModel]?
}
