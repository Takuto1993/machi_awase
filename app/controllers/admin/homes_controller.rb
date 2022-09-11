class Admin::HomesController < ApplicationController
  
  #管理者でログインしていない場合は管理者ログイン画面へ
  before_action :authenticate_admin!
  
  def top
  end
end
