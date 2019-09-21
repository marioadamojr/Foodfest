class GuestsController < ApplicationController
    def new
       @guest = Guest.new
    end

    def create
        @guest = Guest.create(guest_params)
        if @guest.save
            session[:guest_id] = @guest.id
            # flash[:success] = "You have successfully created a new guest!"
            redirect_to @guest
        else
            binding.pry
            redirect_to '/signup' 
        end
    end

    def show
        if logged_in?
            @guest = Guest.find(params[:id])
        else
            redirect_to '/'
        end
    end

    def index
        # @guests = Guest.all
    end

    private

    def guest_params
        params.require(:guest).permit(:name, :email, :password, :money, :admin, :festival_id)
    end
end