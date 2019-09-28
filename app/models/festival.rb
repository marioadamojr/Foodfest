class Festival < ApplicationRecord
    has_many :trucks
    has_many :tickets
    has_many :users, through: :tickets
end
