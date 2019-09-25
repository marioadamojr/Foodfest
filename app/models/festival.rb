class Festival < ApplicationRecord
    has_many :foods
    has_many :trucks, through: :foods
end
