//
//  VideoList.swift
//  Bilibili
//
//  Created by admin on 2020/9/28.
//  Copyright © 2020 MBA. All rights reserved.
//

import SwiftUI
import Alamofire
import WaterfallGrid
import SDWebImageSwiftUI

struct VideoList: View {
    
    @State var videoList: [VideoListModel]?
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        //若不要row分隔线的话：
        UITableView.appearance().separatorStyle = .none
    }

    func getvideos()  {
        AF.api_videoList(finesh:{ (error, results) in
            if((error) != nil){
                print(error?.description as Any)
            }else{
                self.videoList = results
            }
        })
    }
    var body: some View {
        
        NavigationView {
            
            List{
                
                ForEach(0..<(self.videoList?.count ?? 0) , id: \.self) { index in
//                ForEach(self.videoList?, id: \.self) { index in
                    
                    VideoCell(video: self.videoList?[index])
//                    VideoCell(video: index)
                    
                    
                }
                
                .listRowBackground(
                    Color("background3"))
                .background(Color("background3"))
                .animation(.spring())
                
            }
            
            .onAppear(perform: {
                self.getvideos()
            })
            .navigationBarTitle("Text")
        }
        
        
    }
    
    //    }
}

struct VideoList_Previews: PreviewProvider {
    static var previews: some View {
        VideoList()
    }
}




