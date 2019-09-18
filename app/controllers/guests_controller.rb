class GuestsController < ApplicationController
    def new
       @guest = Guest.new
    end

    def create
        @guest = Guest.create(guest_params)
        return redirect_to '/signup' unless @guest.save
        session[:guest_id] = @guest.id
        redirect_to @guest
    end

    def show
        if logged_in?
            @guest = Guest.find(params[:id])
        else
            redirect_to '/'
        end
    end

    private

    def guest_params
        params.require(:guest).permit(:name, :email, :password, :money, :admin, :festival_id)
    end
end