class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to admin_user_path(@user.id)
  end

  private

  def user_patams
    params.require(:user).permit(:name, :email, :encrypted_password, :password, :is_deleted)
  end
end
