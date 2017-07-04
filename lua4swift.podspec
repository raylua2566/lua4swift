Pod::Spec.new do |s|
  s.author        = { "RayLua" => "raylua2566@hotmail.com" }
  s.name          = "lua4swift"
  s.version       = "0.0.1"
  s.summary       = "A short description of Lua4Swift."
  s.homepage      = "http://localhost/Lua4Swift"
  s.license       = "MIT"
  s.source        = { :git => "http://localhost/Lua4Swift.git", :tag => "0.0.1" }
  s.source_files  = ["Lua/**/*.swift" , "LuaSource/**/*.{h,m,c}"]
  s.resources     = "Plugins/**/*.lua"
  s.framework    = 'Foundation'
end
