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
    doruisection()
    dorcomsection()
    dorothersection()
}
// UI测试
func doruisection(){
    DoraemonManager.shareInstance().addPlugin(withTitle: "弹框", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.Dormsg", atModule: "UI")
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "动画", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorCommonView", atModule: "UI")
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "输入限制", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorTextFied", atModule: "UI")
}
// 常用功能
func dorcomsection(){
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "突出tabbar", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorUGTabBarController", atModule: "功能测试")
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "pageview", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorUGPageviewController", atModule: "功能测试")
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "启动视频", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorLaunchViewvideo", atModule: "功能测试")
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "启动图片", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorLaunchView", atModule: "功能测试")
    
     DoraemonManager.shareInstance().addPlugin(withTitle: "密码登陆", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorloginwithPassword", atModule: "功能测试")
    
    DoraemonManager.shareInstance().addPlugin(withTitle: "注销", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.Dorsinout", atModule: "功能测试")
}
//第三方测试
func dorothersection(){
    
       DoraemonManager.shareInstance().addPlugin(withTitle: "折线图", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorLineChartViewVC", atModule: "第三方功能")
    
     DoraemonManager.shareInstance().addPlugin(withTitle: "FontAwesome", icon: "doraemon_netflow_list_select", desc: "用于app内部弹框测试", pluginName: "UGSwiftMagicbox.DorFontAwesome", atModule: "第三方功能")
    
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
