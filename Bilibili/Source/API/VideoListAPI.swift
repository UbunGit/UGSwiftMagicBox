//
//  VideoListAPI.swift
//  Bilibili
//
//  Created by admin on 2020/9/29.
//  Copyright © 2020 MBA. All rights reserved.
//

import Foundation
import Alamofire
import UGSwiftbox


extension Session{
    
    func api_videoList(finesh:@escaping  (NSError?, [VideoListModel]?) ->  ()){
        let url = "https://api.bilibili.com/pgc/season/rank/web/list"
        let parameters = ["day":3,"season_type":1]
        self.request(url, method: .get, parameters: parameters){ urlRequest in
            urlRequest.timeoutInterval = 5
        }
        .responseResult(finesh: { (error, datadic) in
            
            if(error != nil){
                finesh(error, nil)
            }else{
                let jsonDic = (datadic?["list"] != nil) ? datadic?["list"] : []
                let jsonDecoder = JSONDecoder()
                let jsonData = try? JSONSerialization.data(withJSONObject: jsonDic as Any, options: [])
                let videos:[VideoListModel]? = try! jsonDecoder.decode([VideoListModel].self, from: jsonData!)
                finesh(nil, videos)
                
            }
         })
    }
}
