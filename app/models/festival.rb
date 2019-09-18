class Festival < ApplicationRecord
    has_many :guests
    has_many :trucks
end
