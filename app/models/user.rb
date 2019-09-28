class Guest < ApplicationRecord
    has_secure_password
    has_many :tickets
    has_many :festivals, through: :tickets
end
