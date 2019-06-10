//
//  NicknameInputView.swift
//  FlowerLive
//  昵称输入框
//  Created by admin on 2019/5/22.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class NickNameInputView: UIView {
    
    @objc dynamic var rightLab = UILabel() //右边按钮
    @objc dynamic var nicknameTF = UITextField() //昵称输入框
    @objc dynamic var lineview = UIView() //底部线
    
    init() {
        super.init(frame: .zero)
        self.addSubview(rightLab)
        self.addSubview(nicknameTF)
        self.addSubview(lineview)
        
        nicknameTF.textColor = .darkGray
        nicknameTF.font = .systemFont(ofSize: 18);
        nicknameTF.ug_maxlength = 10
        
        
        rightLab.text = "0/10"
        rightLab.textColor = .darkGray
        rightLab.font = .systemFont(ofSize: 18)
        
        lineview.backgroundColor = .lightGray
        
        nicknameTF.snp.makeConstraints { (snp) in
            snp.left.bottom.top.equalToSuperview()
            snp.right.equalTo(rightLab.snp.left).offset(-12)
        }
        rightLab.snp.makeConstraints { (snp) in
            snp.right.bottom.top.equalToSuperview()
            snp.width.equalTo(48)
        }
        lineview.snp.makeConstraints { (snp) in
            snp.left.right.bottom.equalToSuperview()
            snp.height.equalTo(KHeight_Line)
        }
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
