//
//  UGTabBarController.swift
//  FlowerLive
//
//  Created by 杨西川 on 2019/5/22.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class UGTabBarController: UITabBarController {
    
    let centanimateView  = CentanimateView()//中间按钮点击后弹出的框
    let centBabBar  = LHCenterTabBar()//中间按钮点击后弹出的框
    var lastindex  = 0//记录上次选中的index
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// 设置 tabbar 子控件
        createChildController()

        /// 设置 tabbar 默认颜色
        setDefaultConfit()

        /// 解决 iPhone X tabbar 高度变矮的问题
        tabBar.addObserver(self, forKeyPath: "frame", options: [.old, .new], context: nil)
        centanimateView.openvideoView.clickBtn.addTarget(self, action: #selector(openvideoClick), for: .touchUpInside)
        centanimateView.releasevideokView.clickBtn.addTarget(self, action: #selector(releasevideokClick), for: .touchUpInside)
        centanimateView.releasenewsView.clickBtn.addTarget(self, action: #selector(releasenewsClick), for: .touchUpInside)
        
    }

    func createChildController() {
        // 首页
        addChildVC(childVc: HomeViewController(), title: "0", image: "tab_ic_home_normal", selectedImage: "tab_ic_home_selected")
        // 股票评估
        addChildVC(childVc: SharesViewController(), title: "1", image: "tab_ic_rooms_normal", selectedImage: "tab_ic_rooms_selected")
        setCenterBtn()
        addChildVC(childVc: UIViewController(), title: "3", image: "tab_ic_dynamic_normal", selectedImage: "tab_ic_dynamic_selected")
        addChildVC(childVc: UIViewController(), title: "4", image: "tab_ic_me_normal", selectedImage: "tab_ic_me_selected")
    }

    func setCenterBtn() {
    
        centBabBar.tabbarBtn.setImage(UIImage(named: "tab_ic_live"), for: .normal)
        centBabBar.tabbarBtn.setImage(UIImage(named: "tab_ic_live"), for: .highlighted)
        centBabBar.tabbarBtn.addTarget(self, action: #selector(centerBtnDidClick), for: .touchUpInside)
        
        setValue(centBabBar, forKey: "tabBar")
    }
    

    /// 中间按钮点击
    @objc func centerBtnDidClick() {
    
        
        if centanimateView.isShow {
            centanimateView.hidden()
        }else{
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z") // 让其在z轴旋转
            rotationAnimation.toValue = NSNumber(value: .pi * 2.0) // 旋转角度
            rotationAnimation.duration = 0.11 // 旋转周期
            rotationAnimation.isCumulative = true // 旋转累加角度
            rotationAnimation.repeatCount = 5 // 旋转次数
            centBabBar.tabbarBtn.layer.add(rotationAnimation, forKey: "rotationAnimation")
            centanimateView.show(with: self.view)

        }
    }
    
    /// 开播
    @objc func openvideoClick() {
        centanimateView.hidden()
   
      
    }
    /// 发布视频
    @objc func releasevideokClick() {
        centanimateView.hidden()
    }
    /// 发布动态
    @objc func releasenewsClick() {
        centanimateView.hidden()
    }

    func addChildVC(childVc: UIViewController, title:String, image: String, selectedImage: String) {
    
        let nav = UINavigationController(rootViewController: childVc)
        let normalImage = UIImage(named: image)
        let selectedImage = UIImage(named: selectedImage)
        nav.navigationItem.title = title
        nav.tabBarItem = tabbarItem(with: title, normalImage: normalImage, selectedImage: selectedImage)
        addChild(nav)
    }

    func tabbarItem(with title: String, normalImage: UIImage?=nil, selectedImage: UIImage?=nil) -> UITabBarItem{
        
        let image = normalImage?.withRenderingMode(.alwaysOriginal)
        let _selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
//        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: _selectedImage)
        let tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: _selectedImage)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], for: .selected)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        return tabBarItem
    }


    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let tabBar = object as? UITabBar, keyPath == "frame" {
            if let oldFrame = change?[.oldKey] as? CGRect, let newFrame = change?[.newKey] as? CGRect {
                if oldFrame.size != newFrame.size {
                    if oldFrame.height > newFrame.height {
                        tabBar.frame = oldFrame
                    } else {
                        tabBar.frame = newFrame
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// 设置 tabbar 默认颜色
    func setDefaultConfit() {

        UITabBar.appearance().tintColor = .green

        /// 设置背景色
        let bgVIew = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kTabBarHeight))
        bgVIew.backgroundColor = .white
        tabBar.insertSubview(bgVIew, at: 0)
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    deinit {
        tabBar.removeObserver(self, forKeyPath: "frame")
    }
}


extension UITabBar {
    //让图片和文字在iOS11下仍然保持上下排列
    override open var traitCollection: UITraitCollection {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UITraitCollection(horizontalSizeClass: .compact)
        }
        return super.traitCollection
    }
}

