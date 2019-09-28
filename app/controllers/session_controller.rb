class SessionController < ApplicationController
  def new
    @user = Guest.new
  end

  def create_nonfacebook
    # binding.pry
    @user = User.find(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/login'
    end
  end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.money = 0
    end
 
    session[:user_id] = @user.id
 
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
