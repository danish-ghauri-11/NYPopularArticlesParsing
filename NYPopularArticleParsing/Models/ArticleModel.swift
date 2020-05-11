//
//  ArticleModel.swift
//  NYPopularArticleParsing
//
//  Created by Danish Ghauri on 10/05/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import SwiftUI

struct ArticleModel: Hashable, Codable,Identifiable {
    
    var id:Int
    var uri:String
    var url:String
    var source:String?
    var published_date:String?
    var byline:String?
    var updated:String?
    var section:String?
    var type:String?
    var title:String?
    var abstract:String?
    var media:[MediaModel]?
}


struct MediaModel:Hashable, Codable {
    
    var type:String?
    var subtype:String?
    var caption:String?
    var copyright:String?
    var mediametadata:[MediaMetaModel]?
}

struct MediaMetaModel:Hashable,Codable {
    
    var url:String?
    var format:String?
    var height:CGFloat?
    var width:CGFloat?
}



struct ArticleKey: CodingKey {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }
}
