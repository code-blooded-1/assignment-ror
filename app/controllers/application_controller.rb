class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user 
        # if current user is already set don't query the database
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
          flash[:alert] = "You must be logged in to perform that action"
          redirect_to login_path
        end
    end

    def destroy_session
        session[:user_id] = nil
    end
    
end
