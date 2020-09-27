//
//  CommonViewTestVC.swift
//  Alamofire
//
//  Created by admin on 2019/5/22.
//

import UIKit
@_exported import DoraemonKit
@_exported import SnapKit

@objc(CommonViewTestVC)

class DormsgTestVC: UIViewController {

    // tableView
    lazy var mTableView: UITableView = {
        
        let tableview = UITableView()
        tableview.backgroundColor = .white
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.ug_navigationBar()
        self.title = "UI测试集合"

        view.addSubview(mTableView)
        mTableView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(self.view)
            make.center.equalTo(self.view)
        }
        
    }

    let datas = ["提示框","Alert"]

    var dataSources = [
        ["msg:", "error","info","succeed"],
        ["Alert:", "测试框"]
    ]
}

extension DormsgTestVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSources.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .default, reuseIdentifier: UITableViewCell.className)
        cell.textLabel?.text = dataSources[indexPath.section][indexPath.row]
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 {
            if row == 1 {
                view.ug_msgerror("这是一条\(dataSources[section][row])消息")
            }
            if row == 2 {
                view.ug_msginfo("这是一条\(dataSources[section][row])消息")
            }
            if row == 3 {
                view.ug_msgsuccess("这是一条\(dataSources[section][row])消息")
            }
        }
        
        if section == 1 {
            if row == 1 {
                view.alert(aview: TsetView(frame: CGRect(x: 0, y: 0, width: 350, height: 200)))
            }
                
            else if row == 2 {
                
            }
                
            else if row == 3 {
                
            }
            else if row == 4 {
                
            }
        }
    }

}

class TsetView: UIView {
    @objc dynamic var collectionView = BlockCollectionView() //
    override init(frame: CGRect) {
        super.init(frame: frame)
        configDefaultUI()
    }
    func configDefaultUI(){
        
        collectionView.layout.scrollDirection = .horizontal  //滚动方向
        collectionView.layout.itemSize = CGSize(width: ug_width, height: ug_height)
        collectionView.layout.minimumLineSpacing = 0
        collectionView.layout.minimumInteritemSpacing = 0.0
        collectionView.collection.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.className)
        collectionView.collection.isPagingEnabled = true
        collectionView.numberOfSections = { (collectionView) in
            return 1
        }
        collectionView.numberOfItemsInSection = { (collectionView,section) in
            
            return 3
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
            
            return CGSize(width: self.ug_width, height: self.ug_height)
            
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
