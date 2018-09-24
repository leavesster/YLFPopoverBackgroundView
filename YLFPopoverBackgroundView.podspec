#
# Be sure to run `pod lib lint YLFPopoverBackgroundView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLFPopoverBackgroundView'
  s.version          = '0.1.0'
  s.summary          = 'support custom PopoverBackgroundView for UIPopoverPresentationController'

  s.description      = <<-DESC
YLFPopoverBackgroundView help you customize UI for UIPopoverPresentationController background;
                       DESC

  s.homepage         = 'https://github.com/leavesster/YLFPopoverBackgroundView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'leavesster'
  s.source           = { :git => 'https://github.com/leavesster/YLFPopoverBackgroundView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YLFPopoverBackgroundView/Classes/**/*'
  
  s.resource_bundles = {
    'YLFPopoverBackgroundView' => ['YLFPopoverBackgroundView/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
