platform :ios, '10.0'
use_frameworks!

target ‘MusicApp’ do
    
    pod 'FSPagerView'
	pod 'Alamofire', '~> 4.4'
	pod 'Kingfisher'
	pod 'SwiftyJSON'
	pod 'MJRefresh'
	pod 'ReachabilitySwift', '~> 3'
	pod 'MBProgressHUD'
    pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift3'
    pod 'KDEAudioPlayer'
end
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
