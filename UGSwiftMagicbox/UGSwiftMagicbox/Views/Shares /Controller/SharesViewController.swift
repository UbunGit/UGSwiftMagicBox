//
//  SharesViewController.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/11/24.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

class SharesViewController: UIViewController {
    
    @objc dynamic var homePageHeadView = BlockCollectionView()
    
    private lazy var datalist:[String] = {
        
        return ["测评","历史","消息"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI(){
        view.backgroundColor = UIColor.white;
         // 头部
         view.addSubview(homePageHeadView)
        homePageHeadView.backgroundColor = UIColor.yellow;
        homePageHeadView.layout.scrollDirection = .vertical
         homePageHeadView.numberOfItemsInSection = { (collectionView,section) in
             return self.datalist.count
         }
         homePageHeadView.didSelectItemBlock = { (collectionView,indexPath) in
             
         }
         homePageHeadView.cellForItemAtBlock = { (collectionView,indexPath) in
             let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: PageHeadViewCell.className, for: indexPath) as! PageHeadViewCell
             // 备注我们的小标题
             let indexString = self.datalist[indexPath.row]
             cell.titleLab.text = indexString
             cell.titleLab.font = .systemFont(ofSize: 20)
            cell.backgroundColor = UIColor.red;
             return cell;
         }
         homePageHeadView.sizeForItemAt = {(collectionView,layer,indexPath) in
             return CGSize(width: 68, height: 44)
         }
         
        self.homePageHeadView.collection.reloadData()
    }
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        homePageHeadView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    

}
