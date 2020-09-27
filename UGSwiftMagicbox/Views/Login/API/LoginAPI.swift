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

extension Session{
    
    func loginpassword(usetname:String, password:String, finesh:@escaping finesh) {
        let url = basturl + "/user/passwordlogin"
      
        let parameters = ["phone":usetname,"password":password]
        AF.ug_request(url,method: .post, parameters: parameters, finesh: finesh)
    }
}

