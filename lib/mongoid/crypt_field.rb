module Mongoid
  module CryptField

    def self.included(base)
      base.extend(ClassMehtods)
    end

    module ClassMehtods
      def crypt_field(field_name)

        raise "field name can not be blank" if field_name.blank?

        field_sym = field_name.to_sym
        field_str = field_name.to_s
        salt_sym = "#{field_str}_salt".to_sym

        field field_sym
        field salt_sym

        define_method("#{field_str}_equal_to".to_sym) do |value|
          if Digest::SHA2.hexdigest(value + "mongoid crypt field" + self[salt_sym]) == self[field_sym]
            return true
          else
            return false
          end
        end

        define_method("#{field_str}=") do |new_value|
          self[salt_sym] = self.object_id.to_s + rand.to_s unless self[salt_sym]
          self[field_sym] = Digest::SHA2.hexdigest(new_value + "mongoid crypt field" + self[salt_sym])
        end
      end
    end

  end
end