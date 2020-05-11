//
//  ErrorModel.swift
//  NYPopularArticleParsing
//
//  Created by Danish Ghauri on 11/05/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import Foundation

struct ErrorModel: Hashable, Codable {

    let fault:ErrorDetailsModel?
}

struct ErrorDetailsModel: Hashable, Codable {

    let faultstring:String?
    let details:[String:String]?
}

