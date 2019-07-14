Pod::Spec.new do |spec|

  spec.name         = "MyBaby"
  spec.version      = "1.0.18"
  spec.summary      = "This frame help to reduce basic code efford"
  spec.description  = "MyBaby frame contain some basic feture for now on but we add lot's of feature in future."
  spec.homepage     = "https://github.com/DaddyCode/MyBaby"
  spec.license      = "MIT"
  spec.author       = { "Pawan Kumar" => "pk5340124@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.swift_version  = '4.0'
  spec.source       = { :git => "https://github.com/DaddyCode/MyBaby.git", :tag => "1.0.18" }
  spec.source_files  = "MyBaby/**/*"
  spec.exclude_files = "MyBaby/MyBaby/*.plist"
  spec.ios.framework  = 'UIKit'
  spec.ios.framework  = 'CoreLocation'
  spec.dependency 'Alamofire'


end
