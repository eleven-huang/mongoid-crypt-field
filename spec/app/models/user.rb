class User
  include Mongoid::Document
  include Mongoid::CryptField

  crypt_field :password

end