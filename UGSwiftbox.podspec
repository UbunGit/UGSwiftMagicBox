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
  end
  
  s.subspec 'request' do |spec|
    spec.ios.dependency 'Alamofire'
    s.source_files = 'Source/Request/*.swift'
  end
  
    # s.frameworks = 'CFNetwork'
  end
