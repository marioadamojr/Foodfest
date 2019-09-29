class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to '/'
    else
      # normal log in
      @user = User.find_by(:email => params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to '/login'
      end
    end
  end

  def create_github
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
