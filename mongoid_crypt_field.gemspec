$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid_crypt_field/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid_crypt_field"
  s.version     = MongoidCryptField::VERSION
  s.authors     = ["eleven huang"]
  s.email       = ["11.eleven.huang@gmail.com"]
  s.homepage    = "https://github.com/eleven-huang/mongoid-crypt-field"
  s.summary     = "Add crypt field for mongoid document"
  s.description = "Add crypt field for mongoid document"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  #s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "rails"

  s.add_dependency "mongoid"

end
