//
//  FontAwesomeExampleVC.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/13.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

struct Types {
    static let types: [FontAwesomeType] = {
        return FontAwesomeType.allCases
    }()
}

class FontAwesomeExampleVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    let types: [FontAwesomeType] = Types.types

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FontAwesome(\(types.count))"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical  //滚动方向
        layout.itemSize = CGSize(width: 80, height: 60)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 2
        // 设置CollectionView
        let collectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FontAwesomeExampleCell.self, forCellWithReuseIdentifier: FontAwesomeExampleCell.className)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FontAwesomeExampleCell.className, for: indexPath)
        (cell as? FontAwesomeExampleCell)?.type = types[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)//分别为上、左、下、右
    }
}

class FontAwesomeExampleCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    let iconLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configDefaultUI()
    }

    func configDefaultUI(){
        
        let randcolor = UIColor.ug_randomColor
        layer.borderWidth = 0.5;
        addSubview(titleLabel)
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0;
        titleLabel.textColor = randcolor
        
//        iconLabel.font = UIFont.fa!.fontSize(100)
        iconLabel.textAlignment = .center
        iconLabel.textColor = randcolor
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        addSubview(iconLabel)
        iconLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(40)
        }
    }
    
    var type: FontAwesomeType = .unknown {
        didSet {
            iconLabel.fa.text = type
            titleLabel.text = "\(type.self)"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
