Pod::Spec.new do |s|
  s.name          = "Lua4Swift"
  s.version       = "0.0.1"
  s.summary       = "A short description of Lua4Swift."
  s.description   = <<-DESC
                   DESC
  s.homepage      = "http://EXAMPLE/Lua4Swift"
  s.license       = "MIT (example)"
  s.source        = { :git => "http://EXAMPLE/Lua4Swift.git", :tag => "0.0.1" }
  s.source_files  = "Sources/**/*.swift"
  s.resources     = "Resources/**/*.lua"
  s.dependency 'lua', '~> 5.3'

end
