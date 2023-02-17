class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:notice] = "Logged in successfully"
          redirect_to root_path
      else
          flash[:alert] = "There was something wrong with your login details"
          redirect_to login_path
      end
  end

  def destroy
      session[:user_id] = nil
      flash[:notice] = "Logged out"
      redirect_to users_path
  end
end
