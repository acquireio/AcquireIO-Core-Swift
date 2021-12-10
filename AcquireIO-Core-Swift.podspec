Pod::Spec.new do |s|
  s.name             = 'AcquireIO-Core-Swift'
  s.version          = '1.1.2'
  s.summary          = 'Your complete customer communication platform - and not just live chat'
  s.homepage         = 'https://acquire.io/'
  s.license          = { :type => 'Commercial', :text => 'Copyright (C) 2021 by Acquire' }
  s.author           = { 'Acquire' => 'chirag.savaliya@acquire.io' }
  s.source           = { :git => 'https://github.com/acquireio/AcquireIO-Core-Swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/acquire_io'
  
  s.ios.deployment_target = '10.0'
  
  s.swift_version = '5.3'
  
  s.ios.vendored_frameworks = 'AcquireIOSDK.xcframework'
 
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
  s.xcconfig     = {'ENABLE_BITCODE'=> 'NO'}
  
  s.dependency 'Socket.IO-Client-Swift', '~> 15.2'
  s.dependency 'GoogleWebRTC', '1.1.31999'
end
