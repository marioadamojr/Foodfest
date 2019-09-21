class Truck < ApplicationRecord
    belongs_to :festival
    has_many :foods
    has_many :guests, through: :foods

    accepts_nested_attributes_for :foods

end
