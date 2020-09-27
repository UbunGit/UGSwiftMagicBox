# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

use_frameworks!

def commonPods
    
    pod 'MBProgressHUD'
    pod 'SnapKit'
    pod 'SDWebImage'
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'ChartsRealm'
    pod 'TABAnimated'
    pod 'FontAwesomeKit.Swift'
    pod 'Alamofire'
    
end

def doraemonPods
    
    pod 'CocoaLumberjack/Swift'

    pod 'DoraemonKit/Core', '~> 1.1.8'
    pod 'DoraemonKit/WithLogger', '~> 1.1.8'
    pod 'DoraemonKit/WithGPS', '~> 1.1.8'
    pod 'DoraemonKit/WithLoad', '~> 1.1.8'
    
end


def debugPods
    
end


target 'UGSwiftMagicbox' do
    commonPods #开源
    doraemonPods #本地
    debugPods #Debug
    
    pod 'UGSwiftbox' ,:path=>'./UGSwiftbox.podspec'
    
end
