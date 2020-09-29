//
//  HomeHotViewController.swift
//  FlowerLive
//
//  Created by admin on 2019/5/25.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class HomeHotViewController: UIViewController {

    
    typealias HotScrollViewDidScroll = (UICollectionView) ->  ()
    var hotScrollViewDidScroll : HotScrollViewDidScroll?
    
    @objc dynamic var collectionView = BlockCollectionView() //
    @objc dynamic var topbackgroundImgview = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDefaultUI()
        
    }
    
    func configDefaultUI(){
        /// 设置导航栏透明
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        // 头部
        
        collectionView.collection.insertSubview(topbackgroundImgview, at: 0)
        topbackgroundImgview.image = UIImage(named: "home_img_bg")
        topbackgroundImgview.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
        }
        topbackgroundImgview.layer.zPosition = -1;
      
        collectionView.layout.scrollDirection = .vertical  //滚动方向
        collectionView.layout.itemSize = CGSize(width: 180, height: 144)
        collectionView.layout.minimumLineSpacing = 8.0
        collectionView.layout.minimumInteritemSpacing = 8.0
        
        collectionView.collection.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.className)
        collectionView.collection.register(RecommendCollectionCell.self, forCellWithReuseIdentifier: RecommendCollectionCell.className)
        collectionView.collection.register(ChartCollectionViewCell.self, forCellWithReuseIdentifier: ChartCollectionViewCell.className)
        collectionView.collection.register(HomeBandleCell.self, forCellWithReuseIdentifier: HomeBandleCell.className)
        
        collectionView.numberOfSections = { (collectionView) in
            return 4
        }
        collectionView.numberOfItemsInSection = { (collectionView,section) in
            if(section == 0){
                return 1
            }else if(section == 1){
                return 1
            }else if(section == 2){
                return 1
            }
            return 80
        }
        collectionView.didSelectItemBlock = { (collectionView,indexPath) in
            
        
        }
        collectionView.cellForItemAtBlock = { (collectionView,indexPath) in
            
            if(indexPath.section == 0){
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBandleCell.className, for: indexPath) as! HomeBandleCell
                cell.backgroundColor = .ug_randomColor
                
                return cell;
            }else if(indexPath.section == 1){
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionCell.className, for: indexPath) as! RecommendCollectionCell
                cell.titleLab.text = "官方推荐"
                return cell;
            }else if(indexPath.section == 2){
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionViewCell.className, for: indexPath) as! ChartCollectionViewCell
                return cell;
            }else{
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.className, for: indexPath) as! VideoCollectionViewCell
                cell.titleLab.text = "你愿意为我而停留不止你愿意为我而停留不止..."
                cell.nickLab.text = "我是大小姐我是大小姐我是大小姐我是大小姐"
                cell.tagView.tagLab.text = "新人"
                cell.backgroundColor = .ug_randomColor
                let name = String(indexPath.row%20)
                
                let filePath = Bundle.main.path(forResource: name, ofType: "jpg") ?? ""
                let url = URL(fileURLWithPath: filePath)
                cell.videoimgView.sd_setImage(with: url)
                return cell;
            }
            
            
            
        }
        collectionView.sizeForItemAt = {(collectionView,layer,indexPath) in
            
            if(indexPath.section == 0){
                return CGSize(width: collectionView.bounds.size.width, height: 238)
            }else if(indexPath.section == 1){
                return CGSize(width: collectionView.bounds.size.width, height: 234)
            }else if(indexPath.section == 2){
                return CGSize(width: collectionView.bounds.size.width, height: 88)
            }
            return CGSize(width: KScale(value: 173), height: KScale(value: 210))
            
        }
        collectionView.insetForSectionAt = {(collectionView,layer,section) in
            if section>=3 {
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)//分别为上、左、下、右
            }else{
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
        collectionView.scrollViewDidScroll = {(collectionView) in
            
            if let block = self.hotScrollViewDidScroll{
                block(collectionView)
            }
            
        }

        view.addSubview(collectionView)
    
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: -kStatusBarHeight, left: 0, bottom: 0, right: 0))
        }
    }
    
    
    



}
