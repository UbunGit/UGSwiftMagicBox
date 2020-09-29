//
//  LoginwithPasswordVC.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/13.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit
import UGSwiftbox
import Alamofire

class LoginwithPasswordVC: UIViewController {
    
    
    lazy var passwordCon:PasswordContentView = {
        let passwordCon = PasswordContentView()
        passwordCon.ug_radius(radius: radiusnomal)
        // 登陆
        passwordCon.commitBtn.rx.tap
            .subscribe(onNext:{
                self.view.endEditing(true)
                self.view.loading()
                AF.loginpassword(usetname: self.passwordCon.userNameinput.inputTF.text!,
                                 password: self.passwordCon.passwordinput.inputTF.text!,
                                 finesh: { (error, datadic) in
                                    self.view.hideloading()
                                    if(error != nil){
                                        self.view.ug_msgerror(error?.domain)
                                    }else{
                                        self.view.ug_msginfo("登陆成功")
                                    }
                                 })
            })
            .disposed(by: disposeBag)

        
        
        return passwordCon
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        configui()
    }
    
    func configui(){
        
        title = "登陆"
        view.backgroundColor = UIColor(named: "background2")
        view.addSubview(passwordCon)

    } 
}

extension LoginwithPasswordVC{
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        passwordCon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(120)
            make.left.equalToSuperview().offset(borderDefual)
            make.right.equalToSuperview().offset(-borderDefual)
        }
    }
}


