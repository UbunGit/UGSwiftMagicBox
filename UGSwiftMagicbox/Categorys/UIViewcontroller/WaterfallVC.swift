//
//  WaterfallVC.swift
//  UGSwiftMagicbox
//  瀑布流
//  Created by admin on 2019/6/10.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

private let kWaterCellID = "kWaterCellID"

class WaterfallVC: UIViewController, UICollectionViewDataSource, WaterfallLayoutDataSource,UICollectionViewDelegateFlowLayout  {
    
    var count : Int = 2000
    
    typealias HotScrollViewDidScroll = (UICollectionView) ->  ()
    var hotScrollViewDidScroll : HotScrollViewDidScroll?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI(){
        
        // 1.设置布局
        let layout = WaterfallLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.dataSource = self
        
        // 2.创建UICollectionView
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: kWaterCellID)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: -kNavigationHeight, left: 0, bottom: 0, right: 0))
        }
        collectionView.backgroundColor = .white
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kWaterCellID, for: indexPath) as! VideoCollectionViewCell
        
        cell.backgroundColor = .ug_randomColor
        cell.titleLab.text = "你愿意为我而停留不止你愿意为我而停留不止..."
        cell.nickLab.text = "我是大小姐我是大小姐我是大小姐我是大小姐"
        cell.tagView.tagLab.text = "新人"
        cell.tagView.tagLab.fa.text = .star
        cell.backgroundColor = .ug_randomColor
        let name = String(indexPath.row%20)
        
        let filePath = Bundle.main.path(forResource: name, ofType: "jpg") ?? ""
        let url = URL(fileURLWithPath: filePath)
        cell.videoimgView.sd_setImage(with: url)
        
        return cell
    }
  
    func waterfallLayout(_ layout: WaterfallLayout, indexPath: IndexPath) -> CGFloat {
        return CGFloat(arc4random_uniform(50) + 150)
    }
    
    func numberOfColsInWaterfallLayout(_ layout: WaterfallLayout) -> Int {
        return 2
    }


}

extension WaterfallVC{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let block = self.hotScrollViewDidScroll{
            block(scrollView as! UICollectionView)
        }

    }
  
}
