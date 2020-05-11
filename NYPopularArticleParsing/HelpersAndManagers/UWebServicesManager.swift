//
//  UWebServicesManager.swift
//  NYPopularArticleParsing
//
//  Created by Danish Ghauri on 10/05/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import Alamofire

class UWebServicesManager{
    
    static let sharedInstance: UWebServicesManager = {
        let instance = UWebServicesManager()
        return instance
        }()
    
    func getRequestForData (params:[String:String]?,service:String, completionHandler:@escaping (_ jsonData:Data?,_ errorStr:String?,_ statusCode:Int)->()) {
            
        AF.request("\(baseURL)\(service)", method: .get, parameters: params, encoder: JSONParameterEncoder.default, headers:nil).response { response in
            
            guard case let .failure(error) = response.result else {
                debugPrint(response)
                
                completionHandler(response.data,nil,response.response!.statusCode)
                return
            }
            print(error.localizedDescription)

            completionHandler(nil,error.localizedDescription,response.response?.statusCode ?? 404)
            
        }
    }
    
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint(self)
           // CLSLogv("%@", getVaList([debugPrint(self) as! CVarArg]))
        #endif
        return self
    }
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

func loadJSON<T: Decodable>(_ jsonData: Data) -> T {
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .custom { keys -> CodingKey in
            let key = keys.last!.stringValue.split(separator: "-").joined()
            return ArticleKey(stringValue: String(key))!
        }
        return try decoder.decode(T.self, from: jsonData)
    } catch {
        fatalError("Couldn't parse as \(T.self):\n\(error)")
    }
}

