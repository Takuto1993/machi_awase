class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @places = @user.places
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_active: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :password)
  end
end
