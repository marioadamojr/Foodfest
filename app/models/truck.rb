class Truck < ApplicationRecord
    has_many :foods
    has_many :festivals, through: :foods

    accepts_nested_attributes_for :foods

end
