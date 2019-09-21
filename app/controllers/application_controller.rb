class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    protect_from_forgery with: :exception


    def current_user
        @current_user ||= Guest.find_by(id: session[:guest_id])
    end

    def logged_in?
        !!current_user
    end
end
