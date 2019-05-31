//
//  VideoCollectionViewCell.swift
//  FlowerLive
//
//  Created by admin on 2019/5/25.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit
import SDWebImage

class TagView: UIView{
    
    @objc dynamic var tagLab = LHCentLable() //标签
    @objc dynamic var tagimgView = UIImageView() //标签图片
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configDefaultUI()
    }

    func configDefaultUI(){
        addSubview(tagLab)
        addSubview(tagimgView)
        tagimgView.image = UIImage(named: "home_img_label")
        tagLab.font = .systemFont(ofSize: 12)
        tagLab.shadowColor = .darkGray//设置阴影颜色
        tagLab.shadowOffset = CGSize(width: 1, height: 1)//设置阴影大小
        tagLab.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        tagimgView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class WatchView: UIView{
    
    @objc dynamic var watchcountLab = UILabel() //标签
    @objc dynamic var watchimgView = UIImageView() //观看人数图片
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configDefaultUI()
    }
    
    func configDefaultUI(){
        addSubview(watchcountLab)
        addSubview(watchimgView)
        watchcountLab.text = "120"
        watchcountLab.font = .systemFont(ofSize: 12)
        watchcountLab.textColor = .white
        watchcountLab.shadowColor = .darkGray//设置阴影颜色
        watchcountLab.shadowOffset = CGSize(width: 1, height: 1)//设置阴影大小
        
        let path = Bundle.main.path(forResource:"live", ofType:"gif")
        watchimgView.sd_setImage(with: URL(fileURLWithPath: path!))
        watchcountLab.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        watchimgView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(watchcountLab.snp.left).offset(-8)
            make.size.equalTo(12)
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCollectionViewCell: UICollectionViewCell {
    
    @objc dynamic var tagView = TagView() //标签
    @objc dynamic var nickLab = UILabel() //昵称
    @objc dynamic var watchView = WatchView() //观看人数
    @objc dynamic var titleLab = UILabel() //标题
    @objc dynamic var videoimgView = UIImageView() //直播图片
 
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configDefaultUI()
    }
    

    func configDefaultUI(){
        layer.cornerRadius = 4
        addSubview(videoimgView)
        addSubview(tagView)
        addSubview(nickLab)
        addSubview(watchView)
        addSubview(titleLab)
        
    
        titleLab.font = .systemFont(ofSize: 12)
        titleLab.textColor = .white
        titleLab.shadowColor = .darkGray//设置阴影颜色
        titleLab.shadowOffset = CGSize(width: 1, height: 1)//设置阴影大小
        
        nickLab.font = .systemFont(ofSize: 12)
        nickLab.textColor = .white
        nickLab.shadowColor = .darkGray//设置阴影颜色
        nickLab.shadowOffset = CGSize(width: 1, height: 1)//设置阴影大小
        
        videoimgView.backgroundColor = .ug_randomColor
        videoimgView.contentMode = .scaleAspectFill
        videoimgView.clipsToBounds = true
    
        videoimgView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.size.equalTo(self.snp.width)
        }
        
        nickLab.snp.remakeConstraints { (make) in
            make.left.equalTo(KPanding_12)
            make.right.equalTo(watchView.snp.left).offset(-8)
            make.bottom.equalTo(videoimgView).offset(-KPanding_12)
        }
        
        tagView.snp.remakeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.equalTo(56)
            make.height.equalTo(22)
        }
        watchView.snp.remakeConstraints { (make) in
            make.bottom.equalTo(videoimgView).offset(-KPanding_12)
            make.right.equalToSuperview().offset(-KPanding_12)
            make.width.equalTo(56)
            make.height.equalTo(16)
        }
        titleLab.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(KPanding_12)
            make.right.equalToSuperview().offset(-KPanding_12)
            make.top.equalTo(videoimgView.snp.bottom)
     
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        let path = Bundle.main.path(forResource:"live", ofType:"gif")
        watchView.watchimgView.sd_setImage(with: URL(fileURLWithPath: path!))
    }

}


