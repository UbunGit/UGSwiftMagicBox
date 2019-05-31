//
//  RecommendCollectionCell.swift
//  FlowerLive
//  官方推荐
//  Created by admin on 2019/5/25.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class RecommendCollectionCell: UICollectionViewCell {
    
    @objc dynamic var titleLab = UILabel() //右边按钮
    @objc dynamic var collectionView = BlockCollectionView() //
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configDefaultUI()
    }
    func configDefaultUI(){
        
        collectionView.layout.scrollDirection = .horizontal  //滚动方向
        collectionView.layout.itemSize = CGSize(width: 180, height: 144)
        collectionView.layout.minimumLineSpacing = 8.0
        collectionView.layout.minimumInteritemSpacing = 0.0
        collectionView.collection.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.className)
        
        collectionView.numberOfSections = { (collectionView) in
            return 1
        }
        collectionView.numberOfItemsInSection = { (collectionView,section) in
           
            return 8
        }
     
        collectionView.cellForItemAtBlock = { (collectionView,indexPath) in
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.className, for: indexPath) as! VideoCollectionViewCell
            
            cell.backgroundColor = .ug_randomColor
            cell.titleLab.text = "你愿意为我而停留不止..."
            cell.nickLab.text = "我是大小姐"
            cell.tagView.tagLab.text = "人气"
            cell.backgroundColor = .ug_randomColor
            let name = String(indexPath.row%20)
            
            let filePath = Bundle.main.path(forResource: name, ofType: "jpg") ?? ""
            let url = URL(fileURLWithPath: filePath)
            cell.videoimgView.sd_setImage(with: url)
            return cell;
        }
        collectionView.sizeForItemAt = {(collectionView,layer,indexPath) in
            
           return CGSize(width: 156, height: 194)
  
        }
        collectionView.insetForSectionAt = {(collectionView,layer,section) in
            
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)//分别为上、左、下、右
         
        }
        addSubview(collectionView)
        addSubview(titleLab)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(49)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        titleLab.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
