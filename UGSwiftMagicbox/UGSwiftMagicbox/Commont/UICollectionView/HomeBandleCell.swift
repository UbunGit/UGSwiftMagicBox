//
//  HomeBandleCell.swift
//  FlowerLive
//
//  Created by admin on 2019/5/25.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class HomeBandleCell: UICollectionViewCell {
    
    @objc dynamic var collectionView = BlockCollectionView() //
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configDefaultUI()
    }
    func configDefaultUI(){
        
        collectionView.layout.scrollDirection = .horizontal  //滚动方向
        collectionView.layout.itemSize = CGSize(width: kScreenWidth, height: 238)
        collectionView.layout.minimumLineSpacing = 0
        collectionView.layout.minimumInteritemSpacing = 0.0
        collectionView.collection.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.className)
        collectionView.collection.isPagingEnabled = true
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
            cell.tagView.isHidden = true
            let name = String(indexPath.row%20)
            
            let filePath = Bundle.main.path(forResource: name, ofType: "jpg") ?? ""
            let url = URL(fileURLWithPath: filePath)
            cell.videoimgView.sd_setImage(with: url)
            cell.videoimgView.contentMode = .scaleAspectFill
            return cell;
        }
        collectionView.sizeForItemAt = {(collectionView,layer,indexPath) in
            
            return CGSize(width: kScreenWidth, height: 238)
            
        }
        collectionView.insetForSectionAt = {(collectionView,layer,section) in
            
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)//分别为上、左、下、右
            
        }
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
