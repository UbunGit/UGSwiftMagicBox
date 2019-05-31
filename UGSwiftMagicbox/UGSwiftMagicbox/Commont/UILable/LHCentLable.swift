//
//  LHCentLable.swift
//  FlowerLive
//  默认文字在中间的lable
//  Created by admin on 2019/5/22.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class LHCentLable: UILabel {

    
    init() {
        super.init(frame: .zero)
        textAlignment = .center
        textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
