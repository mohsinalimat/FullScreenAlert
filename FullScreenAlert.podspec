Pod::Spec.new do |s|
  s.name         = "FullScreenAlert"
  s.version      = "1.0.0"
  s.summary      = "A stylish full screen alert that is customizable. "
  s.description  = "FullScreenAlert is a stylish, flexible and customizable full screen style alert. It helps you to notify user if something happened. FullScreenAlert library can be used in any IOS 9.0+ application."
  s.homepage     = "https://github.com/MaeseppTarvo/FullScreenAlert"
  s.screenshots  = "https://github.com/MaeseppTarvo/FullScreenAlert/blob/master/Success.png?raw=true", "https://github.com/MaeseppTarvo/FullScreenAlert/blob/master/Error.png?raw=true", "https://github.com/MaeseppTarvo/FullScreenAlert/blob/master/Warning.png?raw=true"
  s.license      = { :type => "MIT" }
  s.author       = { "Tarvo Mäesepp" => "tarvomaesepp@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/MaeseppTarvo/FullScreenAlert.git", :tag => "1.0.0" }
  s.source_files  = "FullScreenAlert", "FullScreenAlert/**/*.{xib,swift}"
  s.resource_bundles  = {"FullScreenAlert" => ['FullScreenAlert/Resources/**/*']}
  s.framework  = "UIKit"
end
