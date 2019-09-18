class SessionController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
    # binding.pry
    @guest = Guest.find(params[:email])
    if @guest && @guest.authenticate(params[:password])
        session[:guest_id] = @guest.id
        redirect_to @guest
      else
        redirect_to '/login'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
