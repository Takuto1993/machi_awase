class Admin::UsersController < ApplicationController
  def index
    #入力が無いときすべて表示
    if params[:search] == nil
      @users = User.all
    #入力に空白がある時はすべて表示
    elsif params[:search] == '　'
      @users = User.sll
    #入力がある時に検索する文字に登録したカラムとヒットした場合
    else
      @users = User.where("name LIKE?", '%' + params[:search] + '%')
    end
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

  def  toggle
    @user = User.find(params[:user_id])
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
