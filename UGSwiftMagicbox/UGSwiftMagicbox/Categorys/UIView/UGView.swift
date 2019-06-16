//
//  UIView+exteension.swift
//  OLMagicBox_Swift
//
//  Created by admin on 2019/5/23.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
@_exported import MBProgressHUD

// MARK: - Properties

public extension UIView {
    
    /// Size of view.
    var ug_size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.ug_width = newValue.width
            self.ug_height = newValue.height
        }
    }
    
    /// Width of view.
    var ug_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    /// Height of view.
    var ug_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
}

public extension UIView {
    //设置圆角
    func ug_radius(radius: CGFloat){
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

}


