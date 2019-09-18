class Food < ApplicationRecord
    belongs_to :guest
    belongs_to :truck
end
