Pod::Spec.new do |s|
    s.name = 'UGSwiftbox'
    s.version = '1.0.1'
    s.license = 'MIT'
    s.summary = 'Swift'
    s.homepage = 'https://github.com/UbunGit'
    s.authors = { '静静的白色外套' => '296019487@qq.coms' }
    s.source = { :git => 'https://github.com/UbunGit/UGSwiftMagicbox.git', :tag => s.version }
    s.documentation_url = 'https://github.com/UbunGit/UGSwiftMagicbox/'
  
    s.ios.deployment_target = '13.0'
    s.swift_versions = ['5.1', '5.2']
  
    
  
  
  s.default_subspec = 'All'
  s.subspec 'All' do |spec|
    spec.ios.dependency 'UGSwiftbox/request'
    spec.ios.dependency 'UGSwiftbox/extension'
    spec.ios.dependency 'UGSwiftbox/swiftUI'
  end
  
  s.subspec 'request' do |spec|
    spec.ios.dependency 'Alamofire'
    spec.source_files = 'Source/request/**/*.swift'
  end
  
  s.subspec 'extension' do |spec|
    spec.ios.dependency "MBProgressHUD"
    spec.ios.dependency "SnapKit"
    spec.source_files = 'Source/extension/**/*.swift'
  end
  
  s.subspec 'swiftUI' do |spec|
    spec.source_files = 'Source/swiftUI/**/*.swift'
  end
  
    # s.frameworks = 'CFNetwork'
  end
