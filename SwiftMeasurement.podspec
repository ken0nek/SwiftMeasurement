Pod:: Spec.new do |s|
  s.name    = 'SwiftMeasurement'
  s.version = '0.4'

  s.osx.deployment_target     = '10.12'
  s.ios.deployment_target     = '10.0'
  s.tvos.deployment_target    = '10.0'
  s.watchos.deployment_target = '3.0'

  s.license  = 'MIT'
  s.summary  = 'The best way to deal with Measurements and Units in Swift'
  s.homepage = 'https://github.com/ken0nek/SwiftMeasurement'
  s.author   = { 'Ken Tominaga' => 'ken.for.develop@gmail.com' }
  s.source   = { :git => 'https://github.com/ken0nek/SwiftMeasurement.git', :tag => s.version.to_s }

  s.source_files = 'Sources/**/*'

  s.frameworks = 'Foundation'
end
