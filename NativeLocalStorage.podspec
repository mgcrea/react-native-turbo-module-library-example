require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name         = "NativeLocalStorage"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => '14.0' }
  s.source       = { :git => "https://github.com/mgcrea/react-native-local-storage.git", :tag => "#{s.version}" }

  s.xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'SWIFT_COMPILATION_MODE' => 'wholemodule',
    # 'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/Headers/Public/NativeLocalStorage"'
  }

  s.source_files = "ios/**/*.{h,m,mm,cpp,swift}"
  # s.public_header_files = "ios/**/*.h"
  s.private_header_files = "ios/generated/**/*.h"

  install_modules_dependencies(s)
end
