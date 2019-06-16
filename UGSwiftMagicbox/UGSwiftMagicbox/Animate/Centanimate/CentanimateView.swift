//
//  CentanimateView.swift
//  FlowerLive
//  tabbar中间按钮点击弹出动画
//  Created by admin on 2019/5/24.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class CentanimateView: UIView {

    @objc dynamic var openvideoView = ImageLableBtnView()   // 我要开播
    @objc dynamic var releasenewsView = ImageLableBtnView()       // 发布动态
    @objc dynamic var releasevideokView = ImageLableBtnView()      // 发布视频
    @objc dynamic var consentview = UIImageView()      // 放上面三个的view
    @objc dynamic var closeBtn = UIButton()      // 放上面三个的view
    @objc dynamic var isShow = false
    
    
    init() {
        super.init(frame: .zero)
        addSubview(consentview)
        addSubview(closeBtn)
        closeBtn.addTarget(self, action: #selector(hidden), for: .touchUpInside)
        
        closeBtn.setImage( UIImage(named: "live_btn_close"), for: .normal)
        consentview.image = UIImage(named: "live_img_bg")
        consentview.isUserInteractionEnabled = true
        consentview.addSubview(openvideoView)
        consentview.addSubview(releasenewsView)
        consentview.addSubview(releasevideokView)
        // "我要开播"
        openvideoView.titleLab.snp.remakeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        openvideoView.titleimgview.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.size.equalTo(openvideoView.snp.width)
        }
        openvideoView.titleimgview.image = UIImage.init(named: "live_btn_live")
        openvideoView.titleLab.text = "我要开播"
        openvideoView.titleLab.font = .systemFont(ofSize: 12)
        openvideoView.titleLab.textAlignment = .center
        // "发布动态"
        releasenewsView.titleLab.snp.remakeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        releasenewsView.titleimgview.snp.remakeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.width.equalTo(releasenewsView.snp.width)
        }
        releasenewsView.titleLab.font = .systemFont(ofSize: 12)
        releasenewsView.titleimgview.image = UIImage.init(named: "live_btn_dynamic")
        releasenewsView.titleLab.text = "发布动态"
        releasenewsView.titleLab.textAlignment = .center
        
        // "发布视频"
        releasevideokView.titleLab.snp.remakeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        releasevideokView.titleimgview.snp.remakeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.width.equalTo(releasevideokView.snp.width)
        }
        releasevideokView.titleimgview.image = UIImage.init(named: "live_btn_video")
        releasevideokView.titleLab.font = .systemFont(ofSize: 12)
        releasevideokView.titleLab.text = "发布视频"
        releasevideokView.titleLab.textAlignment = .center
   
        configDefaultUI()
    }
    func configDefaultUI(){
        self.backgroundColor = UIColor.clear
        self.alpha = 0;
        consentview.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(224)
        }
        openvideoView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.bottom).offset(-10)
            make.width.equalTo(5)
            make.centerX.equalToSuperview()
        }
        releasenewsView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.bottom).offset(-10)
            make.width.equalTo(5)
            make.centerX.equalToSuperview()
        }
        releasevideokView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.bottom).offset(-10)
            make.width.equalTo(5)
            make.centerX.equalToSuperview()
        }
        self.closeBtn.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.bottom).offset(-(20+kTabBarHeight))
            make.width.equalTo(59)
            make.height.equalTo(59)
        }
       
    }
    func show(with:UIView) {
        with.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(224)
        }
     
        self.layoutIfNeeded()
        UIView.animateKeyframes(withDuration: 0.55, delay: 0, options: .calculationModeLinear, animations: {

            self.openvideoView.snp.remakeConstraints { (make) in
                make.bottom.equalTo(self.snp.bottom).offset(-(kTabBarHeight+33))
                make.left.equalToSuperview().offset(35)
                make.width.equalTo(54)
                make.height.equalTo(76)
            }
          
            self.releasenewsView.snp.remakeConstraints { (make) in
                make.bottom.equalToSuperview().offset(-(kTabBarHeight+53))
                make.centerX.equalToSuperview()
                make.width.equalTo(54)
                make.height.equalTo(76)
            }
            self.releasevideokView.snp.remakeConstraints { (make) in
                make.bottom.equalTo(self.snp.bottom).offset(-(kTabBarHeight+33))
                make.right.equalToSuperview().offset(-35)
                make.width.equalTo(54)
                make.height.equalTo(76)
            }
       
            
            self.alpha = 1;
            self.layoutIfNeeded()
        })
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z") // 让其在z轴旋转
        rotationAnimation.toValue = NSNumber(value: .pi * 2.0) // 旋转角度
        rotationAnimation.duration = 0.05 // 旋转周期
        rotationAnimation.isCumulative = true // 旋转累加角度
        rotationAnimation.repeatCount = 11 // 旋转次数
        closeBtn.layer.add(rotationAnimation, forKey: "rotationAnimation")
     
         self.layoutIfNeeded()
        isShow = true
      
    }
    @objc func hidden() {
        
        UIView.animate(withDuration: 0.55) {
            
            self.openvideoView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.snp.bottom).offset(-10)
                make.width.equalTo(5)
                make.centerX.equalToSuperview()
            }
            self.releasenewsView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.snp.bottom).offset(-10)
                make.width.equalTo(5)
                make.centerX.equalToSuperview()
            }
            self.releasevideokView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.snp.bottom).offset(-10)
                make.width.equalTo(5)
                make.centerX.equalToSuperview()
            }
            self.alpha = 0;
            self.layoutIfNeeded()
        }
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z") // 让其在z轴旋转
        rotationAnimation.toValue = NSNumber(value: .pi * -2.0) // 旋转角度
        rotationAnimation.duration = 0.05 // 旋转周期
        rotationAnimation.isCumulative = true // 旋转累加角度
        rotationAnimation.repeatCount = 11 // 旋转次数
        closeBtn.layer.add(rotationAnimation, forKey: "rotationAnimation")
        isShow = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
