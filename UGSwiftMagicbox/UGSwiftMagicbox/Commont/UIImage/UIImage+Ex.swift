//
//  UIImage+Extension.swift
//  FlowerLive
//
//  Created by admin on 2019/5/28.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import Foundation

extension UIImage {
    // 返回一定透明度的image
    public func imageWithalpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    /// 异步设置任意弧度高性能圆角图片
    func cornerImage(size:CGSize, radius:CGFloat, fillColor: UIColor, completion:@escaping ((_ image: UIImage)->())) -> Void {
        //异步绘制裁切
        DispatchQueue.global().async {
            //利用绘图建立上下文
            UIGraphicsBeginImageContextWithOptions(size, true, 0)
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            //设置填充颜色
            fillColor.setFill()
            UIRectFill(rect)
            //利用贝塞尔路径裁切
            let path = UIBezierPath.init(roundedRect: rect, cornerRadius: radius)
            path.addClip()
            self.draw(in: rect)
            //获取结果
            let resultImage = UIGraphicsGetImageFromCurrentImageContext()
            //关闭上下文
            UIGraphicsEndImageContext()
            //主队列回调
            DispatchQueue.main.async {
                completion(resultImage!)
            }
        }
    }
}
