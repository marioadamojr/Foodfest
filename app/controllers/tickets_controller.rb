class TicketsController < ApplicationController
    def create
        if Ticket.exists?(user_id: current_user.id, festival_id: params[:festival_id])
            flash[:notice] = "You already have a ticket to this Festival" 
            redirect_to "/users/#{current_user.id}"
        else
            @ticket = Ticket.new(user_id: current_user.id, festival_id: params[:festival_id])
            @ticket.save
            flash[:notice] = @ticket.ticket_sign_up
            redirect_to "/users/#{current_user.id}"
        end
    end
end
  