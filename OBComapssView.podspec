Pod::Spec.new do |s|
s.name             = 'OBComapssView'
s.version          = '0.0.1'
s.summary          = 'Pod for creating compass in iOS'

s.description      = <<-DESC
OBComapssView helps you to add compass in your iOS application
DESC
s.homepage         = 'https://github.com/osama10/OBComapssView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Osama Bin Bashir' => 'osama.binbashir@yahoo.com' }
s.source           = { :git => 'https://github.com/osama10/OBComapssView.git', :tag => s.version.to_s }

s.ios.deployment_target = '10.0'
s.source_files = 'ComapssView/Compass/**/*.{h,m,swift}'
s.resources = 'ComapssView/Compass/Assets.xcassets/**/*'

s.static_framework = true

end
