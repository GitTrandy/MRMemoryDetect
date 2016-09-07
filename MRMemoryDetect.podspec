
Pod::Spec.new do |s|

  s.name         = "MRMemoryDetect"
  s.version      = "0.0.1"
  s.summary      = "MRMemoryDetect"

  s.description  = "MRMemoryDetect is design for iOS detect memory change"

  s.homepage     = "https://github.com/GitTrandy/MRMemoryDetect"

  #s.license      = "MIT"

  s.author             = { "GitTrandy" => "trandy@qq.com" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/GitTrandy/MRMemoryDetect.git", :tag => "#{s.version}" }

  s.source_files  = "MRMemoryDetect", "MRMemoryDetect/**/*.{h,m}"

  # s.public_header_files = "Classes/**/*.h"

  # s.framework  = "SomeFramework"

  s.requires_arc = true

end
