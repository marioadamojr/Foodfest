class UsersController < ApplicationController
    def new
        @user = User.new
      end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            # flash[:success] = "You have successfully created a new user!"
            redirect_to user_path(current_user.id)
        else
            redirect_to '/' 
        end
    end

    def show
        if logged_in?
            @user = User.find(params[:id])
            @tickets = Ticket.all
            # @festival = Festival.find(@user.festival_id)

        else
            redirect_to '/'
        end
    end

    def index
        @users = User.all
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            redirect_to edit_user_path(@user)
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :money)
    end
     
end