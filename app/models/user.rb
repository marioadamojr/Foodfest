class User < ApplicationRecord
    has_secure_password
    has_many :tickets
    has_many :festivals, through: :tickets


    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
            user.name = auth_hash["info"]["name"]
        end
    end
end
