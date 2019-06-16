//
//  UGRequest.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/15.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Alamofire

let basturl = "http:192.168.1.3:8000"

class UGRequest:NSObject{
    
    typealias finesh = (NSError?, NSDictionary?) ->  ()
    
    public func ug_request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        finesh:@escaping finesh){
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .responseJSON(completionHandler: { (response) in
                print("result==\(response.result)")   // 返回结果，是否成功
                if((response.result.error) != nil){
                    finesh(NSError.init(domain: response.error?.localizedDescription ?? "网路请求失败", code: -1, userInfo: nil),nil)
                }
                if let jsonValue = response.result.value {
                    
                    let tResult = jsonValue as! NSDictionary
                    if(tResult["code"] as? Int != 0){
                        finesh(NSError.init(domain: tResult["message"] as? String ?? "错误", code: tResult["code"] as? Int ?? -1, userInfo: nil), nil)
                    }
                    finesh(nil, jsonValue as? NSDictionary)
                    print("code: \(jsonValue)")
                }else{
                     finesh(NSError.init(domain: response.error?.localizedDescription ?? "数据解析失败", code: -1, userInfo: nil),nil)
                }
                
            })
    }
}



