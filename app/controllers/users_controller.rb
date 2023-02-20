class UsersController < ApplicationController
  before_action :redirect_if_user_logged_in, only: :new
  before_action :require_user, only: [:profile, :edit_profile]

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
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

  def show
    @user = User.find(params[:id])
  end

  def show_articles
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(params.require(:user).permit(:first_name, :last_name))
      flash[:notice] = "Profile Updated successfully"
      redirect_to profile_path
    else
      render 'edit_profile', status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
    
    def redirect_if_user_logged_in
        if logged_in?
            redirect_to profile_path(current_user)
        end
    end
end
