//
//  LHCenterTabBar.swift
//  FlowerLive
//
//  Created by 杨西川 on 2019/5/24.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

typealias LHCenterTabBarDidClickBlock  = () -> ()

class LHCenterTabBar: UITabBar {

    @objc dynamic var  tabbarBtn = UIButton()//LHCenterTabBar button


    override init(frame: CGRect) {
        super.init(frame: frame)
        tabbarBtn.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        addSubview(tabbarBtn)
        
        if IsiPhoneNotchScreen() {
            isTranslucent = false
            backgroundColor = .white
        } else {
            barStyle = .black
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        tabbarBtn.center = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.1)
        let count = items?.count ?? 0

        let btnW: CGFloat = frame.size.width / CGFloat(count + 1)
        let btnH: CGFloat = 49
        let tabBarBtnY: CGFloat = 0

        var tabBarBtnIndex = 0
        for subV in subviews {
            if subV.isKind(of: NSClassFromString("UITabBarButton")!) {
                if tabBarBtnIndex == count / 2 {
                    tabBarBtnIndex += 1
                }
                let btnX = CGFloat(tabBarBtnIndex) * btnW
                subV.frame = CGRect(x: btnX, y: tabBarBtnY, width: btnW, height: btnH)

                tabBarBtnIndex += 1
            }
        }

      
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {

        let view = super.hitTest(point, with: event)

        if let touchView = view {
            if !touchView.isHidden {
                let pointInCenterBtn = self .convert(point, to: tabbarBtn)
                if tabbarBtn.point(inside: pointInCenterBtn, with: event) {
                    return tabbarBtn
                }
            }
        }


        return view
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
