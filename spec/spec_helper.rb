$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

MODELS = File.join(File.dirname(__FILE__), "app/models")
$LOAD_PATH.unshift(MODELS)

require "mongoid"
require "mongoid_crypt_field"
require "rspec"

Dir[ File.join(MODELS, "*.rb") ].sort.each do |file|
  name = File.basename(file, ".rb")
  #autoload name.camelize.to_sym, name
  autoload name.camelize.to_sym, name
end



CONFIG = {
  sessions: {
    default: {
      database: "mongoid_crypt_field_test",
      hosts: [ "localhost:27017" ]
    }
  }
}

Mongoid.configure do |config|
  config.load_configuration(CONFIG)
end