module MongoidCryptField

    def crypt_field(field_name)

      raise "field name can not be empty" if field_name.blank?

      field_sym = field_name.to_sym
      field_str = field_name.to_s
      salt_sym = "#{str}_salt".to_sym

      field field_sym
      field salt_sym

      self[salt_sym] = self.object_id.to_s + rand.to_s


      define_method("#{field_str}_equal_to".to_sym)  |value| do
        if Digest::SHA2.hexdigest(value + "mongoid crypt field" + self[salt_sym]) == self[field_sym]
          return true
        else
          return false
        end
      end

      define_method(sym) |new_value| do
        self[ecypt_field] = Digest::SHA2.hexdigest(new_value + "mongoid crypt field" + self[salt_sym])
      end
    end
end
