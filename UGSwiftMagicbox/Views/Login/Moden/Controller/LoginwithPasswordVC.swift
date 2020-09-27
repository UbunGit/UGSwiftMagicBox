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
    
   let passwordCon = PasswordContentView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configui()
    }
    
    func configui(){
        title = "登陆"
        view.backgroundColor = .white
        view.addSubview(passwordCon)
        passwordCon.ug_radius(radius: radiusnomal)
        passwordCon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview().offset(borderDefual)
            make.right.equalToSuperview().offset(-borderDefual)
        }
        passwordCon.layer.borderColor = UIColor.style_line.cgColor
        passwordCon.layer.borderWidth = CGFloat(lineheight)
        passwordCon.commitBtn.rx.tap
            .subscribe(onNext:{
                self.view.endEditing(true)
                AF.loginpassword(usetname: self.passwordCon.userNameinput.inputTF.text!,
                                        password: self.passwordCon.passwordinput.inputTF.text!,
                                        finesh: { (error, datadic) in
                    if(error != nil){
                        self.view.ug_msginfo(error?.domain)
                    }else{
                        self.view.ug_msginfo("登陆成功")
                    }
                })
            })
            .disposed(by: disposeBag)
    } 
}
