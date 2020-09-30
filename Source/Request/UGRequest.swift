//
//  UGRequest.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/15.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Alamofire



public typealias finesh = (NSError?, NSDictionary?) ->  ()

public extension DataRequest{
    func responseResult (finesh:@escaping finesh) {
        
        self.responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                
                let tResult = value as! NSDictionary
                print("返回码: \(value)")
                if(tResult["code"] as? Int != 200 && tResult["code"] as? Int != 0){
                    finesh(NSError.init(domain: tResult["message"] as? String ?? "错误", code: tResult["code"] as? Int ?? -1, userInfo: nil), nil)
                }else{
                    finesh(nil, tResult["data"] as? NSDictionary)
                }
                
                
                
            case .failure(let error):
                finesh(NSError.init(domain: error.localizedDescription , code: -1, userInfo: nil),nil)
            }
        })
        
    }
}



