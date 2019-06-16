//
//  LoginContentView.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/15.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

class PasswordContentView: UIView {

    let userNameinput = LoginInputView() //用户名输入框
    let passwordinput = LoginInputView() //密码输入框
    let commitBtn = UIButton()      //登陆按钮
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configUI()
    }

    func configUI() {
        backgroundColor = .white
        //用户名输入框
        addSubview(userNameinput)
        userNameinput.iconlab.fa.text = .user
        userNameinput.inputTF.ug_maxlength = 16
        userNameinput.inputTF.placeholder = "用户名/手机号"
        userNameinput.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(borderDefual)
            make.right.equalToSuperview().offset(-borderDefual)
            make.top.equalToSuperview().offset(borderDefual)
            make.height.equalTo(cellheight)
        }
        
        //密码输入框
        addSubview(passwordinput)
        passwordinput.iconlab.fa.text = .shield
        passwordinput.inputTF.ug_maxlength = 16
        passwordinput.inputTF.placeholder = "6～16位密码"
        passwordinput.rightBtn.fa.setTitle(.eye , for: .normal)
        passwordinput.rightBtn.fa.setTitle(.eyeSlash , for: .selected)
        passwordinput.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(borderDefual)
            make.right.equalToSuperview().offset(-borderDefual)
            make.top.equalTo(userNameinput.snp.bottom).offset(borderDefual)
            make.height.equalTo(cellheight)
        }
        passwordinput.rightBtn.rx.tap
            .subscribe(onNext:{
                self.passwordinput.rightBtn.isSelected = !self.passwordinput.rightBtn.isSelected
            })
            .disposed(by: disposeBag)
        
        //登陆按钮
        addSubview(commitBtn)
        commitBtn.setTitle("登陆", for: .normal)
        commitBtn.setTitleColor(.style_des, for: .disabled)
        commitBtn.backgroundColor = .style_defual
        commitBtn.ug_radius(radius: radiusnomal)
        commitBtn.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview().offset(borderDefual)
            make.right.equalToSuperview().offset(-borderDefual)
            make.top.equalTo(passwordinput.snp.bottom).offset(cellheight)
            make.height.equalTo(cellheight)
            make.bottom.equalToSuperview().offset(-borderDefual)
        }
  
        //用户名可用
        let usernameValid = userNameinput.inputTF.rx.text.orEmpty
            .map { $0.count >= 8 }
            .share(replay: 1)
        
        //密码可用
        let passwordValid = passwordinput.inputTF.rx.text.orEmpty
            .map { $0.count >= 6 }
            .share(replay: 1)
        
        //是否可点击
        let iseablecommit = Observable.combineLatest(usernameValid,passwordValid){
            $0 && $1
            }
            .share(replay: 1)
        
        iseablecommit.bind(to:commitBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
