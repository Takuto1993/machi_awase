class User::UsersController < ApplicationController

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
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :encrypted_password, :password)
  end
end
