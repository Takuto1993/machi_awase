class Admin::UsersController < ApplicationController
  
  #管理者でログインしていない場合は管理者ログイン画面へ
  before_action :authenticate_admin!
  
  def index
    #入力が無いときすべて表示
    if params[:search] == nil
      @users = User.page(params[:page]).order(created_at: :desc)
    #入力に空白がある時はすべて表示
    elsif params[:search] == '　'
      @users = User.page(params[:page]).order(created_at: :desc)
    #入力がある時に検索する文字に登録したカラムとヒットした場合
    else
      @users = User.where("name LIKE?", '%' + params[:search] + '%').page(params[:page]).order(created_at: :desc)
    end
  end

  def show
    @user = User.find(params[:id])
    @places = @user.places.page(params[:page]).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to admin_user_path(@user.id)
  end

  #会員を有効にしたり無効にしたりするボタン
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
    params.require(:user).permit(:name, :profile_image, :email, :encrypted_password, :password, :is_deleted)
  end
end
