# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

use_frameworks!

def commonPods
    
    pod 'MBProgressHUD'
    pod 'SnapKit'
    pod 'SDWebImage'
    pod 'RxSwift', '~> 5'
    pod 'RxCocoa', '~> 5'
    pod 'ChartsRealm'
    pod 'TABAnimated'
    pod 'FontAwesomeKit.Swift'
    pod 'Alamofire'
    
    
end

def lhPods
    
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
    lhPods #本地
    debugPods #Debug
    
    # target 'UGSwiftMagicboxTests' do
    #   inherit! :search_paths
    #   # Pods for testing
    # end
    
    # target 'UGSwiftMagicboxTests' do
    #   inherit! :search_paths
    #   # Pods for testing
    # end
    
end