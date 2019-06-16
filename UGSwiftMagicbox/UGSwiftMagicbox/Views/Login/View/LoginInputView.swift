//
//  LoginInputView.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/13.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

class LoginInputView: UIView {

    let iconlab = UILabel()      //左边icon
    let inputTF = UITextField()  //输入框
    let rightBtn = UIButton()    //右边按钮
    let lineView = UIView()      // 下划线
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configui()
    }

    func configui(){
        
        addSubview(iconlab)
        addSubview(inputTF)
        addSubview(rightBtn)
        addSubview(lineView)
        iconlab.textColor = .style_des
        iconlab.textAlignment = .center
        iconlab.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(44)
        }
       
        inputTF.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(iconlab.snp.right)
            make.right.equalTo(rightBtn.snp.left)
            make.height.equalToSuperview()
        }
        rightBtn.setTitleColor(.style_des, for: .normal)
        rightBtn.titleLabel?.font = UIFont.fa?.fontSize(12)
        rightBtn.contentMode = .scaleAspectFit
        rightBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        lineView.backgroundColor = .style_des
        lineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.right.left.equalToSuperview()
            make.height.equalTo(lineheight)
        }
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
