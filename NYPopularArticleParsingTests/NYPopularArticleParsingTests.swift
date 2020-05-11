//
//  NYPopularArticleParsingTests.swift
//  NYPopularArticleParsingTests
//
//  Created by Danish Ghauri on 11/05/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import XCTest
@testable import NYPopularArticleParsing

class NYPopularArticleParsingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    // Change service here to run different tests on the service
        super.setUp()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }

    //Checking proper mapping of id from json response of Article
    func testArticleModelIDMapping() throws {
        
        
        let array:[ArticleModel] = load("ArticleData.json")
        if let path = Bundle.main.path(forResource: "ArticleData", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data) as! Array<Any>
                    
                for i in 0...array.count - 1 {
                    
                    let articleObj = array[i]
                    let jsonObj = jsonResult[i] as! Dictionary<String,Any>
                        XCTAssertEqual(articleObj.id,jsonObj["id"] as! Int, "Checking id mapping in object")
                    }
              } catch {
                   // handle error
              }
        }
        
    }
    
    //Checking proper mapping of source from json of Popular Article
    func testArticleModelSourceMapping() throws {
        
        
        let array:[ArticleModel] = load("ArticleData.json")
        if let path = Bundle.main.path(forResource: "ArticleData", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data) as! Array<Any>
                    
                for i in 0...array.count - 1 {
                    
                    let articleObj = array[i]
                    let jsonObj = jsonResult[i] as! Dictionary<String,Any>
                    XCTAssertEqual(articleObj.source,(jsonObj["source"] as! String), "Checking source mapping in object")
                    }
              } catch {
                   // handle error
              }
        }
        
    }
    
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .custom { keys -> CodingKey in
                let key = keys.last!.stringValue.split(separator: "-").joined()
                return ArticleKey(stringValue: String(key))!
            }
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

    

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
