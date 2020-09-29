//
//  LaunchView.swift
//  UGSwiftMagicbox
//  启动页广告
//  Created by admin on 2019/6/10.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit
import AVFoundation

class LaunchView: UIView {
    
    var timer:Timer!
    var interval:Int = 5
    

    lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(imgTouchAction))
        gesture.numberOfTouchesRequired = 1
        imgView.addGestureRecognizer(gesture)
        return imgView
    }()
    
    lazy var skipBtn:UIButton = {
        let skipBtn = UIButton()
        skipBtn.backgroundColor = UIColor(white: 0, alpha: 0.1)
        skipBtn.setTitle("跳过广告\(interval)s", for: .normal)
        skipBtn.setTitleColor(.white, for: .normal)
        skipBtn.titleLabel?.font = .systemFont(ofSize: 12)
        skipBtn.layer.cornerRadius = 15
        skipBtn.layer.masksToBounds = true
        skipBtn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return skipBtn
    }()
    
    fileprivate var playItem:AVPlayerItem{
        get{
            //视频路径
            guard let path = Bundle.main.path(forResource: "000", ofType: "mp4") else {
                fatalError("视频路径出错")
            }
            let url = URL(fileURLWithPath: path)
            let playItem = AVPlayerItem(url: url)
            return playItem
        }
    }
    
    fileprivate lazy var player: AVPlayer = {
        let player = AVPlayer(playerItem:playItem)
        player.actionAtItemEnd = .pause
        //设置播放完成后发送通知
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidPlayToEndTimeNotification(noti:)), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        return player
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        setupUI()
    }
    
 
    
    @objc private func imgTouchAction(){
        //图片广告被点击，这里可以发送通知跳转到指定页面
        dismiss()
    }
    
    private func startTimer(){
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerInterval), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func timerInterval(){
        interval -= 1
        if interval <= 0 {
            interval = 0
            dismiss()
            return
        }
        skipBtn.setTitle("跳过广告\(interval)s", for: .normal)
    }
    
    @objc private func dismiss(){
        if timer != nil {
            if timer.isValid {  //如果定时器开启状态，关闭定时器
                timer.invalidate()
            }
        }
        UIView.animate(withDuration: 0.5, animations: {
            //缩放
            self.imgView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            //渐隐
            self.alpha = 0
        }, completion: { Bool in
            self.removeFromSuperview()
        })
    }
    
    deinit {
        print("启动页移除")
        NotificationCenter.default.removeObserver(self)
    }
}
extension LaunchView{
    /*
     * 图片
     */
    public func setupUI(){
        backgroundColor = .white
        
        addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        imgView.sd_setImage(with: URL(string: "http://img.zcool.cn/community/01e3ee5a6f2aa8a801213466f492ba.JPG@2o.jpg"))
        
        guard let window = UIApplication.shared.delegate?.window else{
            dismiss()
            return;
        }
        window?.isHidden = false
        window?.addSubview(self)
        
        addSubview(skipBtn)
        skipBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(safeAreaInsets.top)
            make.right.equalToSuperview().offset(-25)
            make.size.equalTo(CGSize(width: 80, height: 30))
        }
        //开启定时器
        startTimer()
    }
    
    /*
     * 视频
     */
    
    public func setupVideoUI(){
        backgroundColor = .white
        NotificationCenter.default.addObserver(self, selector: #selector(playVideos), name: NSNotification.Name(rawValue: "appBecomeActive"), object: nil)
        setupForAVplayerView()
        player.play()
        
        guard let window = UIApplication.shared.delegate?.window else{
            dismiss()
            return;
        }
        window?.isHidden = false
        window?.addSubview(self)
        
        //跳过广告
        skipBtn.setTitle("跳过广告", for: .normal)
        addSubview(skipBtn)
        skipBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-25)
            make.size.equalTo(CGSize(width: 80, height: 30))
        }
    }
    
}
//MARK:- 视频相关
extension LaunchView{
    
 
    
    private func setupForAVplayerView(){
        let playerLayer = AVPlayerLayer(player: player)
        guard let window = UIApplication.shared.delegate?.window else{
            dismiss()
            return;
        }

        playerLayer.frame = window!.bounds
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(videoAdTouch))
        gesture.numberOfTapsRequired = 1
        addGestureRecognizer(gesture)
    
    }
    
    @objc private func playerItemDidPlayToEndTimeNotification(noti:Notification){
        player.pause()
        dismiss()
    }
    
    @objc private func videoAdTouch(){
        player.pause()
        //视频被点击 可以发送通知让进行跳转
        dismiss()
    }
    
    @objc private func playVideos(){
        player.play()
    }
}

