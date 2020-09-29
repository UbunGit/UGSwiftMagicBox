//
//  LoginContentView.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/15.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

class PasswordContentView: UIView {
    
    //用户名输入框
    lazy var userNameinput:LoginInputView = {
        let userNameinput = LoginInputView()
        userNameinput.iconlab.fa.text = .user
        userNameinput.inputTF.ug_maxlength = 16
        userNameinput.inputTF.placeholder = "用户名/手机号"
        return userNameinput
    }()
    
    //密码输入框
    lazy var passwordinput:LoginInputView = {
        let passwordinput = LoginInputView()
        passwordinput.iconlab.fa.text = .shield
        passwordinput.inputTF.ug_maxlength = 16
        passwordinput.inputTF.placeholder = "6～16位密码"
        passwordinput.rightBtn.fa.setTitle(.eye , for: .normal)
        passwordinput.rightBtn.fa.setTitle(.eyeSlash , for: .selected)
        passwordinput.inputTF.isSecureTextEntry = true
        
        passwordinput.rightBtn.rx.tap
            .subscribe(onNext:{
                self.passwordinput.rightBtn.isSelected.toggle()
                self.passwordinput.inputTF.isSecureTextEntry.toggle()
            })
            .disposed(by: disposeBag)
        return passwordinput
    }()
    
    //忘记密码
    lazy var forgrtBtn:UIButton = {
        let forgrtBtn = UIButton()
        forgrtBtn.setTitle("忘记密码", for: .normal)
        forgrtBtn.setTitleColor(.style_des, for: .normal)
        forgrtBtn.titleLabel?.font = .systemFont(ofSize: 12)
        return forgrtBtn
    }()
    //注册
    lazy var singnBtn:UIButton  = {
        let singnBtn = UIButton()
        return singnBtn
    }()
    //登陆按钮
    lazy var commitBtn:UIButton  = {
        let commitBtn = UIButton()
        commitBtn.setTitle("登陆", for: .normal)
        commitBtn.style_normal()
        return commitBtn
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        singnBtn.setTitle("加入我们", for: .normal)
        singnBtn.setTitleColor(.style_des, for: .normal)
        singnBtn.titleLabel?.font = .systemFont(ofSize: 12)
        configUI()
    }
    
    func configUI() {
        backgroundColor = UIColor.init(named: "background3")
        addSubview(userNameinput)
        addSubview(passwordinput)
        addSubview(commitBtn)
        addSubview(forgrtBtn)
        addSubview(singnBtn)

        
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

extension PasswordContentView{
    override func layoutSubviews() {
        super .layoutSubviews()
        userNameinput.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(borderDefual)
            make.right.equalToSuperview().offset(-borderDefual)
            make.top.equalToSuperview().offset(borderDefual)
            make.height.equalTo(cellheight)
        }
        passwordinput.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(borderDefual)
            make.right.equalToSuperview().offset(-borderDefual)
            make.top.equalTo(userNameinput.snp.bottom).offset(borderDefual)
            make.height.equalTo(32)
        }
        commitBtn.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview().offset(borderDefual)
            make.right.equalToSuperview().offset(-borderDefual)
            make.top.equalTo(passwordinput.snp.bottom).offset(cellheight)
            make.height.equalTo(cellheight)
        }
        singnBtn.snp.makeConstraints { (make) in
            
            make.top.equalTo(commitBtn.snp.bottom).offset(borderDefual)
            make.right.equalTo(forgrtBtn.snp.left).offset(-borderDefual)
            make.height.equalTo(cellheight)
            make.bottom.equalToSuperview().offset(-borderDefual)
        }
        forgrtBtn.snp.makeConstraints { (make) in
            
            make.top.equalTo(commitBtn.snp.bottom).offset(borderDefual)
            make.right.equalToSuperview().offset(-borderDefual)
            make.height.equalTo(cellheight)
            make.bottom.equalToSuperview().offset(-borderDefual)
        }
    }
}

extension UIButton{
    
    public func style_normal(){
        self.setTitleColor(UIColor(named: "btnnormal_title"), for: .normal)
        self.setTitleColor(UIColor(named: "btndisabled_title"), for: .disabled)
        self.setBackgroundImage(UIColor.ug_toImage(color: UIColor(named: "btnnormal_bg")!), for: .normal)
        self.setBackgroundImage(UIColor.ug_toImage(color: UIColor(named: "btndisabled_bg")!), for: .disabled)
        self.ug_radius(radius: radiusnomal)
    }
}
