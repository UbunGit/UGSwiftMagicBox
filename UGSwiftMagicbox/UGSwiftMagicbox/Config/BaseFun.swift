//
//  BaseFun.swift
//  OLMagicBox_Swift
//
//  Created by MBA on 2019/5/30.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


public let kScreenWidth  : CGFloat = UIScreen.main.bounds.size.width
public let kScreenHeight : CGFloat = UIScreen.main.bounds.size.height

public let KIsPhoneX = Bool(kScreenWidth >= 375.0 && kScreenHeight >= 812.0)
public let kIsiPhoneXR = Bool(kScreenWidth >= 828.0 && kScreenHeight >= 1792.0)
public let kIsiPhoneXS = Bool(kScreenWidth >= 1125.0 && kScreenHeight >= 2436.0)
public let kIsiPhoneXSMAX = Bool(kScreenWidth >= 1242.0 && kScreenHeight >= 2688.0)
/// 判断是否是iPhone X系列
public let kIsiPhoneX_series = (KIsPhoneX==true  || kIsiPhoneXR==true  || kIsiPhoneXS==true || kIsiPhoneXSMAX==true)

/// 导航条的高度
public let kNavigationHeight = CGFloat(kIsiPhoneX_series ? 88 : 64)
/// 状态栏高度
public let kStatusBarHeight = CGFloat(kIsiPhoneX_series ? 44 : 20)
/// tabbar高度
public let kTabBarHeight = CGFloat(kIsiPhoneX_series ? (49 + 34) : 49)
/// 顶部安全区域远离高度
public let kTopSafeHeight = CGFloat(kIsiPhoneX_series ? 44 : 0)
/// 底部安全区域远离高度
public let kBottomSafeHeight = CGFloat(kIsiPhoneX_series ? 34 : 0)
/// 判断是否为 iPhone 5/5S/5C/SE iPhone 678 放大模式
public let kIsiPhone5 = (kScreenWidth == 320.0 && kScreenHeight == 568.0)

public let userDefault = UserDefaults.standard

/// App 名称
public let kAppDisplayName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
/// App 当前版本号
public let kAppCurVersion :String? = (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)

/// 375设计图按比例计算值
func KScale (value :CGFloat) -> CGFloat{
    return (value*kScreenWidth)/375
}

let disposeBag = DisposeBag()

/// 是否是齐刘海屏
///
/// - Returns: 是否是齐刘海屏
public func IsiPhoneNotchScreen() -> Bool {
    var iPhoneNotchDirectionSafeAreaInsets: CGFloat = 0
    if #available(iOS 11.0, *) {
        let window = UIApplication.shared.keyWindow
        let safeAreaInsets: UIEdgeInsets = window?.safeAreaInsets ?? UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        switch (UIApplication.shared.statusBarOrientation) {
        case .portrait:do {
            iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.top
        }
        break;
        case .landscapeLeft: do {
            iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.left;
        }
        break;
        case .landscapeRight: do {
            iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.right;
        }
        break;
        case .portraitUpsideDown: do {
            iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.bottom;
        }
        break;
        default:
            iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.top;
            break;
        }
    }
    return iPhoneNotchDirectionSafeAreaInsets > 20;
}


public let KPanding_10 = 10;//间距
public let KPanding_12 = 12;//间距
public let KPanding_16 = 16;//间距
public let KPanding_18 = 18;//间距
public let KPanding_37 = 37;//间距
public let KPanding_31 = 31;//间距
public let KPanding_48 = 48;//间距

public let KHeight_Line = 1;//间距
public let KHeight_44 = 44;//间距
public let KHeight_98 = 98;//间距
