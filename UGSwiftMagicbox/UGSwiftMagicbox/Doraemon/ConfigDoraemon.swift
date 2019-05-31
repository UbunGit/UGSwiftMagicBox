//
//  ConfigDoraemon.swift
//  OLMagicBox_Swift
//
//  Created by admin on 2019/5/23.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import DoraemonKit
/**
 * 配置哆啦A梦
 */
public func configDoraemon() -> () {
    
  
    DoraemonManager.shareInstance().install()
    DoraemonManager.shareInstance().addPlugin(withTitle: "弹框", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.Dormsg", atModule: "UI")
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "动画", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorCommonView", atModule: "UI")
    
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "突出tabbar", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorUGTabBarController", atModule: "功能测试")
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "pageview", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorUGPageviewController", atModule: "功能测试")
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "注销", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.Dorsinout", atModule: "功能测试")
  
}

/**
 * 日志
 */
public func configLog() -> () {
    
    DDLog.add(DDOSLogger.sharedInstance)
    var loglevel = DDLogLevel(rawValue: 1)!
    #if DEBUG
    loglevel = DDLogLevel(rawValue: 5)!
    #endif
    DDLog.add(DDOSLogger.sharedInstance, with: loglevel)
    let fileLogger: DDFileLogger = DDFileLogger() // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7
    DDLog.add(fileLogger)
}
