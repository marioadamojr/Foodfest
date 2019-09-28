class Ticket < ApplicationRecord
    belongs_to :festival
    belongs_to :guest
end
