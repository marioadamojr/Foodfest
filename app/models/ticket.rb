class Ticket < ApplicationRecord
    belongs_to :festival
    belongs_to :user


    def ticket_sign_up
        # @user = User.find_by(id: session[:user_id])
        # @festival = Festival.find_by(id: festival)
        # @user.festivals << @festival
        # @user.save
        "Thanks for signing up for #{festival.name}!"  
    end
end
