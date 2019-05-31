//
//  ImageLableBtnView.swift
//  FlowerLive
//  包含 一个lable，一个button 一个ImageView 的view 
//  Created by admin on 2019/5/23.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class ImageLableBtnView: UIView {

    @objc dynamic var titleLab = UILabel() // 文字
    @objc dynamic var titleimgview = UIImageView() // 图片
    @objc dynamic var clickBtn = UIButton() // 点击button
    
    init() {
        super.init(frame: .zero)
        
        addSubview(titleLab)
        addSubview(titleimgview)
        addSubview(clickBtn)
        
        configDefaultUI()
    }
    func configDefaultUI() {
        self.backgroundColor = UIColor.clear
        titleLab.snp.makeConstraints { (snp) in
            snp.left.equalTo(titleimgview.snp.right).offset(-KPanding_12)
            snp.centerY.equalToSuperview()
        }
        titleimgview.snp.makeConstraints { (snp) in
            snp.left.equalToSuperview().offset(KPanding_16)
            snp.centerY.equalToSuperview()
        }
        clickBtn.snp.makeConstraints { (snp) in
            snp.left.bottom.top.right.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
