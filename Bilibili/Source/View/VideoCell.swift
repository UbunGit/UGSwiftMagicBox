//
//  VideoCell.swift
//  Bilibili
//
//  Created by admin on 2020/9/28.
//  Copyright © 2020 MBA. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import UGSwiftbox

struct VideoCell: View {
    @State var video:VideoListModel?
   
    var body: some View {
        
        HStack {
   
            WebImage(url:URL(string: video?.cover ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .cornerRadius(8)
                .background(Color.clear)
                .shadow(color: Color("shadow"), radius: 4, x: 4, y: 4)
            
            Spacer()
            
            Text(video?.title ?? "")
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color("info"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
           
        }
        .cornerRadius(8)
        .background( Color.clear)

    }
}


struct VideoCell_Previews: PreviewProvider {
    static var previews: some View {
        VideoCell(video:
                    VideoListModel.init(
                        title:"来自深渊 剧场版总集篇",
                        url:"https://www.bilibili.com/bangumi/play/ss34544",
                        cover:"https://i0.hdslb.com/bfs/bangumi/image/8820c2f5655b29fc0e53f2cdfe2c647e660e1210.jpg"
                    ))
        
        
    }
}


//var json = ["name":"Top50",
//            "cover": "http://i0.hdslb.com/bfs/bangumi/image/8820c2f5655b29fc0e53f2cdfe2c647e660e1210.jpg",
//]
//
//let jsonDecoder = JSONDecoder()
//let jsonData = try? JSONSerialization.data(withJSONObject: json as Any, options: [])
//let video = try! jsonDecoder.decode(VideoListModel.self, from: jsonData!)




