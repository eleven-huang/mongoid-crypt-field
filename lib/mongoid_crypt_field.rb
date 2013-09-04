module MongoidCryptField
  include Mongoid::Document

  def crypt_field(field_name, salt)

    raise "salt must be set" if salt.blank?

    ecypt_field = "ecypt_#{field_name}".to_sym

    field ecypt_field

    define_method("#{field_name}_equal".to_sym)  |value| do

    end

    define_method(field_name.to_sym) |new_value| do
      self[ecypt_field] = Digest::SHA2.hexdigest(new_value + "mongoid crypt field" + salt)
    end
  end
end
