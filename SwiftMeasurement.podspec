Pod:: Spec.new do |s|
  s.name                  = "SwiftMeasurement"
  s.version               = "0.3"
  s.summary               = "The best way to deal with Measurements and Units in Swift"
  s.homepage              = "https://github.com/ken0nek/SwiftMeasurement"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "Ken Tominaga" => "ken.for.develop@gmail.com" }
  s.ios.deployment_target = "10.0"
  s.source                = { :git => "https://github.com/ken0nek/SwiftMeasurement.git", :tag => s.version.to_s }
  s.source_files          = "Sources/**/*"
  s.frameworks            = "Foundation"
end
