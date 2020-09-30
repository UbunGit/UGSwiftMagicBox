//
//  VideoLodeModel.swift
//  Bilibili
//
//  Created by admin on 2020/9/29.
//  Copyright © 2020 MBA. All rights reserved.
//

import Foundation



class VideoListModel: Codable {
    
    @objc dynamic var title:String? //名字
    @objc dynamic var url:String? //播放路径
    @objc dynamic var cover:String?//封面图
    @objc dynamic var desc:String? //详情
    dynamic var stat:VideoStarModel?
    
    class func debug_data() -> VideoListModel{
        let json = """
            {
                         "badge":"独家",
                         "badge_info":{
                             "bg_color":"#00C0FF",
                             "bg_color_night":"#0B91BE",
                             "text":"独家"
                         },
                         "badge_type":1,
                         "cover":"http://i0.hdslb.com/bfs/bangumi/image/85c6e348a00a54d0b86d538efb186e006a027e21.png",
                         "desc":"全25话",
                         "new_ep":{
                             "cover":"http://i0.hdslb.com/bfs/archive/7f0224475479de0225ff4547d297516a54c83299.jpg",
                             "index_show":"全25话"
                         },
                         "pts":900092,
                         "rank":1,
                         "season_id":29325,
                         "stat":{
                             "danmaku":2334155,
                             "follow":5721686,
                             "series_follow":6490039,
                             "view":150443097
                         },
                         "title":"某科学的超电磁炮T",
                         "url":"https://www.bilibili.com/bangumi/play/ss29325"
                     }
            """
            .data(using: .utf8)!
        
        return  try! JSONDecoder().decode(VideoListModel.self, from: json)
    }
    
    class func debug_datas() -> [VideoListModel]{
        let json = """
        [{
            "badge":"会员专享",
            "badge_info":{
                "bg_color":"#FB7299",
                "bg_color_night":"#BB5B76",
                "text":"会员专享"
            },
            "badge_type":0,
            "cover":"http://i0.hdslb.com/bfs/bangumi/image/38e2a273f528fd01c34f1fc4df0f69c64487efad.png",
            "desc":"更新至第1039话",
            "new_ep":{
                "cover":"http://i0.hdslb.com/bfs/archive/cc7a813d3740e0a45ff6fba68d8dc6373d03c2da.png",
                "index_show":"更新至第1039话"
            },
            "pts":457004,
            "rank":7,
            "season_id":33415,
            "stat":{
                "danmaku":1707825,
                "follow":416856,
                "series_follow":2813353,
                "view":66041535
            },
            "title":"名侦探柯南（中配）",
            "url":"https://www.bilibili.com/bangumi/play/ss33415"
        },
        {
            "badge":"出品",
            "badge_info":{
                "bg_color":"#00C0FF",
                "bg_color_night":"#0B91BE",
                "text":"出品"
            },
            "badge_type":1,
            "cover":"http://i0.hdslb.com/bfs/bangumi/image/044eaa60080e172cef2f29e05ffad3fe8b65c86b.jpg",
            "desc":"更新至第13话",
            "new_ep":{
                "cover":"http://i0.hdslb.com/bfs/archive/37b76fe3abe791255bb3f6e9e5c0536f4b7ee314.jpg",
                "index_show":"更新至第13话"
            },
            "pts":337573,
            "rank":8,
            "season_id":33805,
            "stat":{
                "danmaku":212323,
                "follow":2437498,
                "series_follow":2643094,
                "view":24085579
            },
            "title":"炎炎消防队 贰之章",
            "url":"https://www.bilibili.com/bangumi/play/ss33805"
        },
        {
            "badge":"会员专享",
            "badge_info":{
                "bg_color":"#FB7299",
                "bg_color_night":"#BB5B76",
                "text":"会员专享"
            },
            "badge_type":0,
            "cover":"http://i0.hdslb.com/bfs/bangumi/image/f62e3a533ccf9d569847aac6995f32ad152d753f.jpg",
            "desc":"更新至第167话",
            "new_ep":{
                "cover":"http://i0.hdslb.com/bfs/archive/ec2a467cbfb8dc9f10fbc8bfec6d92d5eb2e787b.jpg",
                "index_show":"更新至第167话"
            },
            "pts":268967,
            "rank":9,
            "season_id":5978,
            "stat":{
                "danmaku":3937363,
                "follow":2006899,
                "series_follow":2006952,
                "view":194209397
            },
            "title":"博人传 火影忍者新时代",
            "url":"https://www.bilibili.com/bangumi/play/ss5978"
        },
        {
            "badge":"独家",
            "badge_info":{
                "bg_color":"#00C0FF",
                "bg_color_night":"#0B91BE",
                "text":"独家"
            },
            "badge_type":1,
            "cover":"http://i0.hdslb.com/bfs/bangumi/image/c65e3bf95f1e8fa4aeaa9796c58b0b87fa2545f4.png",
            "desc":"全1话",
            "new_ep":{
                "cover":"http://i0.hdslb.com/bfs/bangumi/f3a5988e38e80768e04030b637e2ab23f18999fc.jpg",
                "index_show":"全1话"
            },
            "pts":221897,
            "rank":10,
            "season_id":34394,
            "stat":{
                "danmaku":153519,
                "follow":3971043,
                "series_follow":3905387,
                "view":4043060
            },
            "title":"路人女主的养成方法 Fine",
            "url":"https://www.bilibili.com/bangumi/play/ss34394"
        },
        {
            "badge":"限时免费",
            "badge_info":{
                "bg_color":"#FB7299",
                "bg_color_night":"#BB5B76",
                "text":"限时免费"
            },
            "badge_type":0,
            "cover":"http://i0.hdslb.com/bfs/bangumi/image/54d9ca94ca84225934e0108417c2a1cc16be38fb.png",
            "desc":"全12话",
            "new_ep":{
                "cover":"http://i0.hdslb.com/bfs/archive/5699aae20f54acc9e2f7741e820828729cddf551.jpg",
                "index_show":"全12话"
            },
            "pts":188507,
            "rank":11,
            "season_id":32781,
            "stat":{
                "danmaku":1453372,
                "follow":6208944,
                "series_follow":6932640,
                "view":75033876
            },
            "title":"刀剑神域 爱丽丝篇 异界战争 -终章-",
            "url":"https://www.bilibili.com/bangumi/play/ss32781"
        }]
        """.data(using: .utf8)!

        return  try! JSONDecoder().decode([VideoListModel].self, from: json)
    }
    
    
}

class VideoStarModel: Codable {
    
    @objc dynamic var danmaku:NSInteger = 0 //弹幕
    @objc dynamic var follow:NSInteger = 0 //关注
    @objc dynamic var series_follow:NSInteger = 0//封面图
    @objc dynamic var view:NSInteger = 0
    
    

    
}
