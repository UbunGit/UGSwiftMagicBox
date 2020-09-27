//
//  LoginAPI.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/15.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

extension UGRequest{
    
    class func loginpassword(usetname:String, password:String, finesh:@escaping finesh) {
        let url = basturl + "/user/passwordlogin"
      
        let parameters = ["phone":usetname,"password":password]
        UGRequest().ug_request(url,method: .post, parameters: parameters, finesh: finesh)
    }
}
