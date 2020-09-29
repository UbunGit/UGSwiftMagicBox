//
//  Color+Exitension.swift
//  OLMagicBox_Swift
//
//  Created by MBA on 2019/5/30.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation



extension UIColor {
    
    /// 返回rgba颜色
    public class func ug_rgba(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    /// 返回随机色
    public class var ug_randomColor: UIColor {
        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        return UIColor.init(red:red, green:green, blue:blue , alpha: 1)
    }
    
    /// 颜色 生成图片
    public class func ug_toImage(color:UIColor)->UIImage{
        let rect = CGRect(x: 0, y: 0, width: 44, height: 375)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
