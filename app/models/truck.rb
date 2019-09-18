class Truck < ApplicationRecord
    belongs_to :festival
    has_many :foods
    has_many :guests, through: :food
end
