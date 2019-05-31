//
//  ChartCollectionViewCell.swift
//  FlowerLive
//  首页/排行榜
//  Created by admin on 2019/5/25.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class ChartCollectionViewCell: UICollectionViewCell {
    @objc dynamic var collectionView = BlockCollectionView() //
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configDefaultUI()
    }
    func configDefaultUI(){
   
        collectionView.layout.scrollDirection = .horizontal  //滚动方向
        collectionView.layout.itemSize = CGSize(width: 180, height: 144)
        collectionView.layout.minimumLineSpacing = 12
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
            return cell;
        }
        collectionView.sizeForItemAt = {(collectionView,layer,indexPath) in
            
            return CGSize(width: 170, height: 48)
            
        }
        collectionView.insetForSectionAt = {(collectionView,layer,section) in
            
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)//分别为上、左、下、右
            
        }
        addSubview(collectionView)
   
        collectionView.snp.makeConstraints { (make) in
           
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(48)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
