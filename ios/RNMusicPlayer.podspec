# RNMusicPlayer.podspec

Pod::Spec.new do |spec|
  spec.name         = 'RNMusicPlayer'
  spec.version      = '0.1.0'
  spec.summary      = 'A React Native audio player module'
  spec.homepage     = 'https://github.com/brian-1812/RNMusicPlayer'
  spec.license      = 'MIT'
  spec.author       = { 'Shokhrukhmirzo Toyirov' => 'brianmaverick090@gmail.com' }
  spec.platform     = :ios, '10.0'
  spec.source       = { :git => 'https://github.com/brian-1812/RNMusicPlayer.git', :tag => spec.version.to_s }
  spec.source_files = 'RNMusicPlayer/**/*.{h,m}'
end
