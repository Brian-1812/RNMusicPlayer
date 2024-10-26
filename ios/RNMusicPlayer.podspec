# RNMusicPlayer.podspec

Pod::Spec.new do |spec|
  spec.name         = 'RNMusicPlayer'
  spec.version      = '0.1.0'
  spec.summary      = 'A React Native audio player module'
  spec.homepage     = 'https://github.com/brian-1812/RNMusicPlayer'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Shokhrukhmirzo Toyirov' => 'toirovshohruxmirzo@gmail.com' }
  spec.platform     = :ios, '12.0'
  spec.source       = { :git => 'https://github.com/brian-1812/RNMusicPlayer.git', :tag => spec.version.to_s }

  puts "Source Files: #{Dir.glob('RNMusicPlayer/**/*.{h,m}').inspect}"
  spec.source_files = 'RNMusicPlayer/Classes/**/*'
end
