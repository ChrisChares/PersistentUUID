#
# Be sure to run `pod lib lint PersistentUUID.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PersistentUUID'
  s.version          = '0.5.0'
  s.summary          = 'Persistent UUIDs'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Access a UUID that persists through app deletion and reinstallation.
                       DESC

  s.homepage         = 'https://github.com/chrischares/PersistentUUID'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Chris Chares' => 'chris@chares.io' }
s.source           = { :git => 'https://github.com/chrischares/PersistentUUID.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PersistentUUID/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PersistentUUID' => ['PersistentUUID/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'KeychainAccess', '~> 3.0.0'
end
