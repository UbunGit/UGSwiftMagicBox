//
//  UINav+Extension.swift
//  OLMagicBox_Swift
//
//  Created by MBA on 2019/5/30.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

extension UINavigationController{
    
    /**
     * 设置导航栏颜色 默认透明
     */
    public func ug_navigationBar(backgroundImage:UIImage=UIImage(), shadowImage:UIImage=UIImage()) {
        
        // 设置导航栏透明
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
    }
}
