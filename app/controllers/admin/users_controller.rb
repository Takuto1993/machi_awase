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

  def withdraw
    @user = User.find(params[:id])
    if @user.is_deleted?
      @user.is_deleted = false
    else
      @user.is_deleted = true
    end
    @user.save
    redirect_to edit_admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :password, :is_deleted)
  end
end