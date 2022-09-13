class User::UsersController < ApplicationController
  
  #ユーザーログインしていない時はログイン画面へ移行（index,showは除外）
  before_action :authenticate_user!, except: [:index, :show]

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
    if @user.update(user_params)
      #パスワード変更をしてもログアウトすることを防ぐ
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :encrypted_password, :password, :is_deleted)
  end
end
