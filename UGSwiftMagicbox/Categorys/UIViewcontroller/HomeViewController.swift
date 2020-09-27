//
//  HomeViewController.swift
//  FlowerLive
//
//  Created by UbunGit on 2019/5/22.
//  Copyright © 2019 lhwl-cee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    @objc dynamic var homePageHeadView = BlockCollectionView() //右边按钮
   
    @objc dynamic var pageViewController:UIPageViewController!
    
    @objc dynamic var selectcell : PageHeadViewCell?
    
    @objc dynamic var headarr = ["热门","关注","同城","制服","才艺"]
    
    private lazy var allViewControllers:[UIViewController] = {
        let vc0 = HomeHotViewController()
        vc0.hotScrollViewDidScroll = {(collectionView) in
            
            let aplat = collectionView.contentOffset.y/200
            var navimage = UIImage(named: "home_img_bg2")?.imageWithalpha(aplat)
            
            self.navigationController?.navigationBar.setBackgroundImage(navimage, for: .default)
            
            let textColor = (1-aplat)*255
            for cell in self.homePageHeadView.collection.visibleCells {
                var pageHeadViewCell = cell as? PageHeadViewCell
                pageHeadViewCell?.titleLab.textColor = .ug_rgba(r: textColor,g: textColor,b: textColor,a: 1)
            }
        }
        let vc1 = HomeHotViewController()
        vc1.view.backgroundColor = .white
        vc1.hotScrollViewDidScroll = {(collectionView) in
            
            let aplat = collectionView.contentOffset.y/200
            var navimage = UIImage(named: "home_img_bg2")?.imageWithalpha(aplat)
            
            self.navigationController?.navigationBar.setBackgroundImage(navimage, for: .default)
            
            let textColor = (1-aplat)*255
            for cell in self.homePageHeadView.collection.visibleCells {
                var pageHeadViewCell = cell as? PageHeadViewCell
                pageHeadViewCell?.titleLab.textColor = .ug_rgba(r: textColor,g: textColor,b: textColor,a: 1)
            }
        }
        let vc2 = WaterfallVC()
        vc2.view.backgroundColor = .white
        vc2.hotScrollViewDidScroll = {(collectionView) in
            
            let aplat = collectionView.contentOffset.y/200
            var navimage = UIImage(named: "home_img_bg2")?.imageWithalpha(aplat)
            
            self.navigationController?.navigationBar.setBackgroundImage(navimage, for: .default)
            
            let textColor = (1-aplat)*255
            for cell in self.homePageHeadView.collection.visibleCells {
                var pageHeadViewCell = cell as? PageHeadViewCell
                pageHeadViewCell?.titleLab.textColor = .ug_rgba(r: textColor,g: textColor,b: textColor,a: 1)
            }
        }
        return [vc0,vc1,vc2]
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDefaultUI()
        
    }
    
    func configDefaultUI(){
        // pageviewController
        
        navigationController?.navigationBar.isTranslucent = true
        view.backgroundColor = UIColor.ug_randomColor
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        addChild(pageViewController)
        self.view.addSubview(pageViewController.view)
        
        // 头部
        view.addSubview(homePageHeadView)
        homePageHeadView.numberOfItemsInSection = { (collectionView,section) in
            return self.allViewControllers.count
        }
        homePageHeadView.didSelectItemBlock = { (collectionView,indexPath) in
            
            let pageHeadViewCell = self.homePageHeadView.collection.cellForItem(at: indexPath) as! PageHeadViewCell
            if self.selectcell != pageHeadViewCell {
                self.selectcell?.isSelected = false
                self.selectcell = pageHeadViewCell
                self.selectcell?.isSelected = true
            }
            self.pageViewController.setViewControllers([self.allViewControllers[indexPath.row]], direction: .forward, animated: true, completion: nil)
        }
        homePageHeadView.cellForItemAtBlock = { (collectionView,indexPath) in
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: PageHeadViewCell.className, for: indexPath) as! PageHeadViewCell
            // 备注我们的小标题
            let indexString = self.headarr[indexPath.row]
            cell.titleLab.text = indexString
            cell.titleLab.font = .systemFont(ofSize: 20)
            return cell;
        }
        homePageHeadView.sizeForItemAt = {(collectionView,layer,indexPath) in
            return CGSize(width: 68, height: 44)
        }
       
//        navigationController?.view.addSubview(homePageHeadView)
        
        homePageHeadView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(kStatusBarHeight)
            make.height.equalTo(44)
            make.right.equalToSuperview().offset(-60)
        }
         self.homePageHeadView.collection.reloadData()
        DispatchQueue.main.async {
           
            let defualindex = IndexPath(row: 0, section: 0)
            self.selectcell = self.homePageHeadView.collection.cellForItem(at: defualindex) as? PageHeadViewCell
            self.homePageHeadView.index = defualindex
            self.selectcell?.isSelected = true
            self.pageViewController.setViewControllers([self.allViewControllers.first!], direction: .forward, animated: true, completion: nil)
            
        }
    }
   
    //返回页面个数
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allViewControllers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //获取当前页面的索引
        guard let index = allViewControllers.firstIndex(of: viewController) else{return nil}
        let indexpath = IndexPath(row: index , section: 0)
        let pageHeadViewCell = self.homePageHeadView.collection.cellForItem(at: indexpath) as? PageHeadViewCell
        
        
        self.selectcell?.isSelected = false
        self.selectcell = pageHeadViewCell
        self.selectcell?.isSelected = true
        homePageHeadView.index = indexpath;
        //前一个页面
        let preIndex = index - 1
        //如果在第一页向右滑动则滚动到最后一页
        if preIndex < 0{
            return allViewControllers.last
        }
        //判断当前索引是否大于0且少于总索引个数
        guard  preIndex>=0 , allViewControllers.count>preIndex else{return nil}
        return allViewControllers[preIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //获取当前页面的索引
        guard let index = allViewControllers.firstIndex(of: viewController) else{return nil}
        let indexpath = IndexPath(row: index , section: 0)
        let pageHeadViewCell = self.homePageHeadView.collection.cellForItem(at: indexpath) as? PageHeadViewCell
     
        self.selectcell?.isSelected = false
        self.selectcell = pageHeadViewCell
        self.selectcell?.isSelected = true
        homePageHeadView.index = indexpath;
        //前一个页面
        let nextIndex = index + 1
        //如果在最后页向左滑动则滚动到第一页
        if nextIndex == allViewControllers.count{
            return allViewControllers.first
        }
        //判断当前索引是否大于0且少于总索引个数
        if allViewControllers.count>nextIndex{
            return allViewControllers[nextIndex]
        }else{
            return nil
        }
    }
    
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
