//
//  String+Extension.swift
//  OLMagicBox_Swift
//
//  Created by MBA on 2019/5/30.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
extension String{
    
    /// 获取文本高度
    ///
    /// - Parameters:
    ///   - textStr: 需要计算的文本
    ///   - font: 文本字体
    ///   - width: 最大宽度
    /// - Returns: 返回计算好的文本高度
    public func ug_getHeigh(font:UIFont,width:CGFloat) -> CGFloat {
        let normalText: NSString = self as NSString
        let size = CGSize(width: width, height: 1000)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).size
        return stringSize.height
    }
    /// 获取文本宽度
    ///
    /// - Parameters:
    ///   - textStr: 需要计算的文本
    ///   - font: 字体
    ///   - height: 最大高度
    /// - Returns: 返回文本宽度
    public func ug_getWidth(textStr:String,font:CGFloat,height:CGFloat) -> CGFloat {
        let normalText: NSString = self as NSString
        let size = CGSize(width: 1000, height: height)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: font)], context: nil).size
        return stringSize.width
    }
    
    /// 判断输入的字符串是否为数字，不含其它字符
    ///
    /// - Parameter string: 需要判断的字符串字符串
    /// - Returns: bool, 是否为纯数字
    public func ug_isPurnInt() -> Bool {
        if self.count == 0 {
            return false
        }
        let scan: Scanner = Scanner(string: self)
        
        var val:Int = 0
        
        return scan.scanInt(&val) && scan.isAtEnd
    }
    
    /// 是否包含空格
    public var ug_containsSpace: Bool {
        let str = self.trimmingCharacters(in: NSCharacterSet.whitespaces)
        return str.count != self.count
    }
    
    /// 时间戳字符串格式化
    ///
    /// - Parameter formate: formate,默认 yyyy年MM月dd日
    /// - Returns: 格式化后的时间字符串
    public func ug_formatedate(_ formate: String?="yyyy年MM月dd日")->String {
        
        let string = NSString(string: self)
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = formate
        let date = NSDate(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date as Date)
        
    }
}
