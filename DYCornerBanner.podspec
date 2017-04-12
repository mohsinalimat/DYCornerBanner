Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "DYCornerBanner"
s.summary = "Customisable corner banner label written in Swift 3"
s.requires_arc = true

# 2
s.version = "1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "[Dominik Butz]" => "[dominikbutz@googlemail.com]" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/DominikButz/DYCornerBanner"



s.source = { :git => "https://github.com/DominikButz/DYCornerBanner.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"


# 8
s.source_files = "DYCornerBanner**/*.{swift, h, plist}"


end
