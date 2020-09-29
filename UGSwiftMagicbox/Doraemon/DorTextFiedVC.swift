//
//  DorTextFiedVC.swift
//  UGSwiftMagicbox
//
//  Created by MBA on 2019/6/3.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

class DorTextFiedVC: UIViewController {
    
    lazy var inputview: NickNameInputView = {
        let inputview = NickNameInputView()
        inputview.nicknameTF.ug_maxlength = 10
        inputview.nicknameTF.placeholder = "最多输入10个字"
        inputview.nicknameTF.setPlaceholder(placeholder: "请输入呢称", font: .systemFont(ofSize: 18), color: .ug_randomColor)
        inputview.nicknameTF.addTarget(self, action: #selector(checkTextEditingChanged), for: .editingChanged)
        return inputview
    }()
    
    lazy var commitBtn:UIButton = {
        let commitBtn = UIButton()
        commitBtn.backgroundColor = .ug_randomColor
        commitBtn.setTitle("确认", for: .normal)
        commitBtn.setTitleColor(.white, for: .disabled)
        commitBtn.setTitleColor(.lightGray, for: .disabled)
        return commitBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TextFied"
        setUI()
    }
    
    func setUI() {
        
        view.backgroundColor = .white
        view.addSubview(inputview)
        view.addSubview(commitBtn)
        
        inputview.nicknameTF.rx.text.orEmpty
            .map{ $0.count>=self.inputview.nicknameTF.ug_maxlength}
            .bind(to:commitBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        commitBtn.rx.tap
            .subscribe(onNext: { [weak self] in self?.showAlert() })
            .disposed(by: disposeBag)
        
    }
    
    func showAlert() {
        view.endEditing(true)
        view.ug_msginfo("确认按钮被点击")
    }
    
    /**
     * 昵称输入框改变后掉用
     */
    @objc private func checkTextEditingChanged(){
        if((inputview.nicknameTF.markedTextRange) == nil){
            
            DispatchQueue.main.async {
                self.inputview.rightLab.text = "\(self.inputview.nicknameTF.text?.count ?? 0)/10"
            }
        }
    }
    
    
    
}

extension DorTextFiedVC{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        inputview.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(144)
            make.height.equalTo(44)
        }
        commitBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
            make.top.equalTo(inputview.snp.bottom).offset(144)
            make.height.equalTo(44)
        }
    }
}
