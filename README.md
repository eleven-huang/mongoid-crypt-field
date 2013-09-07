#mongoid-crypt-field
Add ecrypt field for mongoid document

##How to User

###init

        class User
          include Mongoid::Document
          include Mongoid::CryptField # include module

          crypt_field :password # add crypt field

        end

###check value


        if user.password_equal_to("pass")
           .......
        end


