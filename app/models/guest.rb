class Guest < ApplicationRecord
    has_secure_password
    belongs_to :festival
    has_many :foods
    has_many :trucks, through: :foods
end
