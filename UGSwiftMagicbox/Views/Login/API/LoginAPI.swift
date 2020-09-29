//
//  LoginAPI.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/15.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import UGSwiftbox
import Alamofire

public  let basturl = "http:192.168.1.3:8000"

extension Session{
    
    func loginpassword(usetname:String, password:String, finesh:@escaping finesh) {
        let url = basturl + "/user/passwordlogin"
      
        let parameters = ["phone":usetname,"password":password]
        self.request(url, method: .get, parameters: parameters) { urlRequest in
            urlRequest.timeoutInterval = 5
//            urlRequest.allowsConstrainedNetworkAccess = false
        }
        .responseResult(finesh: finesh)
    
    }
}

