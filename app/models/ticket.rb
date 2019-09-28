class Ticket < ApplicationRecord
    belongs_to :festival
    belongs_to :guest


    def ticket_sign_up
        # @guest = Guest.find_by(id: session[:guest_id])
        # @festival = Festival.find_by(id: festival)
        # @guest.festivals << @festival
        # @guest.save
        "Thanks for signing up for #{festival.name}!"  
    end
end
