//
//  UGAlert.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/15.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

extension UIView {
    
    /**
     * view上弹框
     */
    public func alert(aview:UIView){
        
        let cancelview = UIView()
        let abutton = UIButton()
        abutton.backgroundColor = .ug_randomColor
        abutton.setTitle("关闭", for: .normal)
        cancelview.addSubview(abutton)
        cancelview.addSubview(aview)
        let hub  = MBProgressHUD.showAdded(to: self, animated: true)
        hub.mode = .customView
        hub.customView = cancelview
        hub.backgroundColor = UIColor.clear
        hub.bezelView.style = .solidColor
        hub.bezelView.backgroundColor = .white
        hub.bezelView.layer.shadowColor = UIColor.lightGray.cgColor
        hub.bezelView.layer.shadowOffset = .init(width: 3, height: 3)
        cancelview.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(aview.ug_width)
            make.height.equalTo(aview.ug_height+52)
        }
        aview.snp.makeConstraints { (make) in
            make.top.equalTo(cancelview)
            make.left.right.equalTo(cancelview);
        }
        abutton.snp.makeConstraints { (make) in
            
            make.top.equalTo(aview.snp.bottom).offset(8);
            make.width.equalTo(cancelview);
            make.height.equalTo(44);
            make.bottom.equalTo(cancelview);
        }
        
    }
}
