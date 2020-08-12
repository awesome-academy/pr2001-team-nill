class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.paginate(page: params[:page],per_page: 20)
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted success"
    redirect_to admin_users_url
  end
  private
    def user_params
      params.require(:user).permit :name,:email , :password, :password_confirmation
    end
end
