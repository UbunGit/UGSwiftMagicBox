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






