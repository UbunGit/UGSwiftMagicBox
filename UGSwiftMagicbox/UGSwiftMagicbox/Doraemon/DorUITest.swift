//
//  DorCommonView.swift
//  Alamofire
//
//  Created by admin on 2019/5/22.
//

import UIKit
import DoraemonKit

//提示框
class Dormsg: NSObject,DoraemonPluginProtocol{
    
    func pluginDidLoad() {
        
        let viewcontroller = DormsgTestVC()
        DoraemonUtil.openPlugin(viewcontroller)
    }

}
//凸起的tabbar
class DorUGTabBarController: NSObject,DoraemonPluginProtocol{
    
    func pluginDidLoad() {
        
        let viewcontroller = UGTabBarController()
        DoraemonUtil.openPlugin(viewcontroller)
    }
    
}

// pageviewcontroller 
class DorUGPageviewController: NSObject,DoraemonPluginProtocol{
    
    func pluginDidLoad() {
        
        let viewcontroller = HomeViewController()
        DoraemonUtil.openPlugin(viewcontroller)
    }
    
}

// 输入框长度限制
class DorTextFied: NSObject,DoraemonPluginProtocol{
    
    func pluginDidLoad() {
        
        let viewcontroller = DorTextFiedVC()
        DoraemonUtil.openPlugin(viewcontroller)
    }
    
}

// 启动广告
class DorLaunchView: NSObject,DoraemonPluginProtocol{
    
    func pluginDidLoad() {
         DoraemonManager.shareInstance().hiddenHomeWindow()
        let launchView = LaunchView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        launchView.setupUI()
        
    }
    
}
// 启动广告
class DorLaunchViewvideo: NSObject,DoraemonPluginProtocol{
    
    func pluginDidLoad() {
         DoraemonManager.shareInstance().hiddenHomeWindow()
        let launchView = LaunchView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        launchView.setupVideoUI()
       

    }
    
}









