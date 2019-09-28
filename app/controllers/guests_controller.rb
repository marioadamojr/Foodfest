class GuestsController < ApplicationController
    def new
        @guest = Guest.new
      end

    def create
        @guest = Guest.create(guest_params)
        if @guest.save
            session[:guest_id] = @guest.id
            # flash[:success] = "You have successfully created a new guest!"
            redirect_to guest_path(current_user.id)
        else
            redirect_to '/signup' 
        end
    end

    def show
        if logged_in?
            @guest = Guest.find(params[:id])
            @tickets = Ticket.all
            # @festival = Festival.find(@guest.festival_id)

        else
            redirect_to '/'
        end
    end

    def index
        @guests = Guest.all
    end

    def edit
        @guest = Guest.find_by(id: params[:id])
    end

    def update
        @guest = Guest.find_by(id: params[:id])
        if @guest.update(guest_params)
            redirect_to guest_path(@guest)
        else
            redirect_to edit_guest_path(@guest)
        end
    end


    private

    def guest_params
        params.require(:guest).permit(:name, :email, :password, :money, :uid)
    end
end