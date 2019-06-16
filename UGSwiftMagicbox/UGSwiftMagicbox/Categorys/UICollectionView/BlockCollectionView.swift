//
//  BlockCollectionView.swift
//  FlowerLive
//
//  Created by admin on 2019/5/24.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class BlockCollectionView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    typealias DidSelectItemBlock = (UICollectionView, IndexPath) ->  ()
    typealias CellForItemAtBlock = (UICollectionView, IndexPath) ->  (UICollectionViewCell)
    typealias NumberOfItemsInSection = (UICollectionView, Int) ->  Int
    typealias NumberOfSections = (UICollectionView) ->  Int
    typealias SizeForItemAt = (UICollectionView, UICollectionViewLayout, IndexPath) ->  (CGSize)
    typealias InsetForSectionAt = (UICollectionView, UICollectionViewLayout, Int) ->  (UIEdgeInsets)
    
    typealias ScrollViewDidScroll = (UICollectionView) ->  ()
    
    
    var didSelectItemBlock : DidSelectItemBlock?
    var cellForItemAtBlock : CellForItemAtBlock?
    var numberOfItemsInSection : NumberOfItemsInSection?
    var numberOfSections : NumberOfSections?
    var sizeForItemAt : SizeForItemAt?
    var insetForSectionAt : InsetForSectionAt?
    var scrollViewDidScroll : ScrollViewDidScroll?
    
    let layout = UICollectionViewFlowLayout()
    
    var index: IndexPath = IndexPath(row: 0, section: 0) {
        didSet{
        
            collection.scrollToItem(at: index , at: .centeredHorizontally, animated: true);
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(collection)
        configDefaultUI()
    }
    lazy var collection: UICollectionView = {
        
        layout.scrollDirection = .horizontal  //滚动方向
        layout.itemSize = CGSize(width: 80, height: 44)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        // 设置CollectionView
        let ourCollectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        ourCollectionView.delegate = self
        ourCollectionView.dataSource = self
        ourCollectionView.backgroundColor = UIColor.clear
        ourCollectionView.register(PageHeadViewCell.self, forCellWithReuseIdentifier: PageHeadViewCell.className)
        return ourCollectionView
    }()
    func configDefaultUI() {
        
        self.backgroundColor = UIColor.clear
        collection.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let block = numberOfSections {
            return block(collectionView)
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let block = numberOfItemsInSection {
            
           return block(collectionView,section)
        }
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let block = cellForItemAtBlock{

            return block(collectionView,indexPath)
        }
       
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: PageHeadViewCell.className, for: indexPath) as! PageHeadViewCell
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let block = sizeForItemAt {
            
            return block(collectionView,layout,indexPath)
        }
        return layout.itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let block = didSelectItemBlock {
            block(collectionView,indexPath)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if let block = insetForSectionAt {
           return block(collectionView, collectionViewLayout, section)
        }
        return .zero
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let block = scrollViewDidScroll {
            block(scrollView as! UICollectionView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class PageHeadViewCell: UICollectionViewCell {
    
    @objc dynamic var titleLab = UILabel() //collection
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(titleLab)
        configDefaultUI()
    }
    
    func configDefaultUI(){
        titleLab.textColor = .white
        titleLab.font = .boldSystemFont(ofSize: 22)
        
        titleLab.snp.remakeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
    }
    var _isSelected = false
    override var isSelected: Bool {
        set{
            
            _isSelected = newValue
            if newValue {
                titleLab.font = .boldSystemFont(ofSize: 22)
            }else{
                titleLab.font = .systemFont(ofSize: 18)
            }
        }
        get{
            return _isSelected
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


