//
//  UITextField+Extension.swift
//  OLMagicBox_Swift
//
//  Created by MBA on 2019/5/30.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

/// 默认最大输入字数
var defmaxlength = 20

extension UITextField{
    
    public var ug_maxlength: Int {
        set {
            
            objc_setAssociatedObject(self, &defmaxlength, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
            let center = NotificationCenter.default
            center.addObserver(self, selector: #selector(checkTextFieldText), name:UITextField.textDidChangeNotification , object: nil)
        }
        get {
            if let rs = objc_getAssociatedObject(self, &defmaxlength) as? Int {
                return rs
            }
            return defmaxlength
        }
    }
    
    
    /// 检测如果输入数高于设置最大输入数则截取
    @objc private func checkTextFieldText(){
        
        if ug_maxlength>0 {
            if (self.text?.count)! > ug_maxlength && self.markedTextRange == nil {
                
                if let text = self.text {
                    let index = text.index(text.startIndex, offsetBy: ug_maxlength)
                    self.text = String(text[..<index])
                }
            }
        }
    }
    /// 移除通知
    open override func removeFromSuperview() {
        
        super.removeFromSuperview()
        let center = NotificationCenter.default
        center.removeObserver(self, name: UITextField.textDidChangeNotification, object: nil)
    }
}
