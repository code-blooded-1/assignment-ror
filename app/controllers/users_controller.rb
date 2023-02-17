class UsersController < ApplicationController
  before_action :redirect_if_user_logged_in, only: :new
  before_action :require_user, only: :profile

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Registeration successful"
      redirect_to login_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def profile
  end

  def show_articles
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
    
    def redirect_if_user_logged_in
        if logged_in?
            redirect_to profile_path
        end
    end
end
