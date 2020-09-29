//
//  VideoLodeModel.swift
//  Bilibili
//
//  Created by admin on 2020/9/29.
//  Copyright © 2020 MBA. All rights reserved.
//

import Foundation

class VideoListModel: Codable {
    
    @objc dynamic var title:String = "" //名字
    @objc dynamic var url:String = "" //播放路径
    @objc dynamic var cover:String = "" //封面图
    
    init(title:String, url:String, cover:String) {
        self.title = title
        self.url = url
        self.cover = cover
    }
  
}
