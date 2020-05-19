//
//  ConfigStyle.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/13.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

let borderDefual = 8.0
let lineheight = 0.5
let cellheight = 44
let radiusnomal :CGFloat = 4.0

extension UIColor {
    
    /// 返回rgba颜色
    public class var style_title: UIColor {
        return .ug_rgba(r: 36, g: 35, b: 35, a: 1)
    }
    /// 描述文字颜色
    public class var style_des: UIColor {
        return .ug_rgba(r: 106, g: 106, b: 106, a: 1)
    }
    /// 描述文字颜色
    public class var style_line: UIColor {
        return .ug_rgba(r: 240, g: 240, b: 240, a: 1)
    }
    /// 主题颜色
    public class var style_defual: UIColor{
        return .ug_rgba(r: 136, g: 230, b: 222, a: 1)
    }
}




