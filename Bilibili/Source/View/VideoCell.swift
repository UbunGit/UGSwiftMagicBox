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
        ZStack{

            HStack {
                
                WebImage(url:URL(string: video?.cover ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 160)
                    .cornerRadius(8)
                    .background(Color.clear)
                    .shadow(color: Color("shadow"), radius: 4, x: 4, y: 4)
                
                VStack(alignment: .leading) {
                    Text(video?.title ?? "")
                        .multilineTextAlignment(.leading)
                        .lineLimit(4)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color("card4"))
                    
                    
                    HStack {
                        
                        HIconText(icon:"star", text:video?.stat?.follow.thousand() ?? "0",spacer: 8)
                            .padding(4)
                            .foregroundColor(Color("background3"))
                            .background(Color("primary"))
                            .cornerRadius(4)
                        
                        HIconText(icon:"doc.text", text:video?.stat?.danmaku.thousand() ?? "0",spacer: 8)
                            .padding(4)
                            .foregroundColor(Color("background3"))
                            .background(Color("danger"))
                            .cornerRadius(4)
                        
                        
                        
                    }
                    
                    .padding([.top, .bottom, .trailing])
                    
                    Text(video?.desc ?? "")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color("info"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    HStack(alignment: .bottom) {
                        
                        HIconText(icon:"suit.heart", text:video?.stat?.series_follow.thousand() ?? "0")
                            .foregroundColor(Color("warning"))
                            
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HIconText(icon:"doc.text", text:video?.stat?.view.thousand() ?? "0")
                            .foregroundColor(Color("warning"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.bottom, .trailing], 4.0)
                }
                .padding(.leading)
            }
            .frame(height: 165)
            .cornerRadius(8)
            .background( Color.clear)
            
            NavigationLink(destination:  WebBrowser(address:video?.url ?? "") ) {
                
                EmptyView()
            }
        }
    }
}






struct HIconText: View {
    
    @State var icon:String
    @State var text:String
    @State var spacer:CGFloat=4.0
    
    var body: some View {
        HStack(spacing: spacer) {
            Image(systemName: icon)
                .frame(width: 12, height: 12, alignment: .center)
            Text(text)
                .multilineTextAlignment(.leading)
                .font(.system(size: 12, weight: .bold))
            
            
        }
    }
}

struct VIconText: View {
    
    @State var icon:String
    @State var text:String
    @State var spacer:CGFloat=4.0
    
    
    var body: some View {
        VStack (spacing: spacer){
            Image(systemName: icon)
                .frame(width: 12, height: 12, alignment: .center)
            
            Text(text)
                .multilineTextAlignment(.leading)
                .font(.system(size: 12, weight: .bold))
        }
    }
}


struct VideoCell_Previews: PreviewProvider {
    static var previews: some View {
        VideoCell(video: try? JSONDecoder().decode(VideoListModel.self, from: test_videoCell_json))
    }
}

let test_videoCell_json = """
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
                 "title":"某科学的超电磁炮T某科学的超电磁炮T某科学的超电磁炮T",
                 "url":"https://www.bilibili.com/bangumi/play/ss29325"
             }
    """.data(using: .utf8)!
