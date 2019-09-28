class SessionController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create_nonfacebook
    # binding.pry
    @guest = Guest.find(params[:email])
    if @guest && @guest.authenticate(params[:password])
      session[:guest_id] = @guest.id
      redirect_to @guest
    else
      redirect_to '/login'
    end
  end

  def create
    @guest = Guest.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.money = 0
    end
 
    session[:guest_id] = @guest.id
 
    redirect_to '/'
  end

  def destroy
    session.clear
    redirect_to '/'
  end

    private
 
  def auth
    request.env['omniauth.auth']
  end
end
