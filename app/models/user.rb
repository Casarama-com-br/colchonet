class User < ActiveRecord::Base
   EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
   validates_presence_of :email , :full_name , :location
   validates_length_of :bio , minimum: 30 , allow_black: false
   validates_uniqueness_of :email
   has_secure_password
   validate do
      errors.add(:email , :invalid) unless email.match(EMAIL_REGEXP)
   end
end
