class User < ApplicationRecord
    before_save :before_save {self.email = email.downcase}
    validates :name, presence :true, length: {minimum:6, maximum:50}
    VALIDARE_EMAIL_REGEX = ^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$
    validates :email, presence : true, length: {maximum: 255},
                format:{with: VALIDARE_EMAIL_REGEX},
                uniqueness: {case_sensitive: false}
    had_secure_password
    validates :password, presence: true, length: {minimum: 6}
end
