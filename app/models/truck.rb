class Truck < ApplicationRecord
    has_many :foods, dependent: :destroy
    belongs_to :festival

    accepts_nested_attributes_for :foods

end
