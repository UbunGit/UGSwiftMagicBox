//
//  UGRequest.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/15.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Alamofire


public  let basturl = "http:192.168.1.3:8000"
public    typealias finesh = (NSError?, NSDictionary?) ->  ()

public extension Session{
    
    func ug_request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        finesh:@escaping finesh){
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    
                    let tResult = value as! NSDictionary
                    if(tResult["code"] as? Int != 0){
                        finesh(NSError.init(domain: tResult["message"] as? String ?? "错误", code: tResult["code"] as? Int ?? -1, userInfo: nil), nil)
                    }
                    finesh(nil, value as? NSDictionary)
                    print("code: \(value)")
                    
                case .failure(let error):
                    finesh(NSError.init(domain: error.localizedDescription , code: -1, userInfo: nil),nil)
                }
                
            })
    }
}



