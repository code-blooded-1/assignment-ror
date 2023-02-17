class SessionsController < ApplicationController
    before_action :redirect_if_user_logged_in, only: :new
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:notice] = "Logged in successfully"
          redirect_to profile_path
      else
          flash[:alert] = "There was something wrong with your login details"
          redirect_to login_path
      end
  end

  def destroy
      session[:user_id] = nil
      flash[:notice] = "Logged out"
      redirect_to root_path
  end

  private
    def redirect_if_user_logged_in
        if logged_in?
            redirect_to profile_path
        end
    end
end
