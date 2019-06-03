//
//  DorTextFiedVC.swift
//  UGSwiftMagicbox
//
//  Created by MBA on 2019/6/3.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

class DorTextFiedVC: UIViewController {
    let inputview = NickNameInputView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    func setUI() {
        view.addSubview(inputview)
        inputview.nicknameTF.ug_maxlength = 10
        inputview.nicknameTF.placeholder = "最多输入10个字"
        inputview.nicknameTF.setPlaceholder(placeholder: "请输入呢称", font: .systemFont(ofSize: 18), color: .ug_randomColor)
        
        inputview.nicknameTF.addTarget(self, action: #selector(checkTextFieldText), for: .editingChanged)
        inputview.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8)
            make.left.right.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(144)
            make.height.equalTo(44)
        }
    }
    
    /**
     * 昵称输入框改变后掉用
     */
    @objc private func checkTextFieldText(){
        if((inputview.nicknameTF.markedTextRange) == nil){
            
            DispatchQueue.main.async {
                self.inputview.rightLab.text = "\(self.inputview.nicknameTF.text?.count ?? 0)/10"
            }
        }
    }

}
