class Festival < ApplicationRecord
    has_many :trucks
    has_many :users, through: :tickets
end
