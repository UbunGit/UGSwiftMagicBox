//
//  NSInteger+extension.swift
//  Alamofire
//
//  Created by admin on 2020/9/30.
//

import Foundation

public extension NSInteger{
    func thousand() ->String{
        let tenmillion = self/10000000
        if tenmillion>0 {
          
            return String(format:"%.2f千万", Float(Float(self)/10000000))
        }
        
        let million = self/1000000
        if million>0 {
            let temnum:Float = Float(Float(self)/1000000)
            return String(format:"%.2f百万", temnum)
        }
        
        let thousand = self/10000
        if thousand>0 {
            let temnum:Float = Float(Float(self)/10000)
            return String(format:"%.2f万", temnum)
        }
        
        return String(format:"%.0", self)

    }
}
