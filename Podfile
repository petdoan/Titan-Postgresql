#
#   Created by : Nghia Tran
#   Sun, 25th Sept 2016, Vietnam
#

source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
workspace 'Titan.xcworkspace'

# Pods
def important_pods
    pod 'Alamofire', '~> 4.0'
    pod 'ReSwift', :git => 'https://github.com/ReSwift/ReSwift.git', :tag => '2.1.0'
    pod 'SwiftyBeaver', :git => 'https://github.com/SwiftyBeaver/SwiftyBeaver.git', :tag => '1.1.0'
    pod 'ObjectMapper', :git => 'https://github.com/Hearst-DD/ObjectMapper.git', :tag => '2.1.0'
    pod 'RxSwift',    '= 3.0.0-rc.1'
    pod 'DynamicColor', '~> 3.1.0'
    
    # Realm
    pod 'RealmSwift'
end

# Test
def test_pods
    pod 'Quick', '~> 0.10.0'
    pod 'Nimble', '~> 5.0.0'
end

# macOS
target "Titan" do
  project 'Titan.xcodeproj'
  platform :osx, '10.12'
  important_pods
end

# Titan Kit
target "TitanKitTests" do
    project './TitanKit/TitanKit.xcodeproj'
    platform :osx, '10.12'
    test_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.12'
    end
  end
end
