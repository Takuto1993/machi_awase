class Admin::CouponsController < ApplicationController
  
  #管理者でログインしていない場合は管理者ログイン画面へ
  before_action :authenticate_admin!
  
  def index
    #入力が無いときすべて表示
    if params[:search] == nil
      @coupons = Coupon.page(params[:page]).order(created_at: :desc)
    #入力に空白がある時はすべて表示
    elsif params[:search] == ' '
      @coupons = Coupon.page(params[:page]).order(created_at: :desc)
    #入力がある時に検索する文字に登録したカラムとヒットした場合
    else
      @coupons = Coupon.where("shop LIKE? OR coupon_name LIKE?", '%' + params[:search] + '%', '%' + params[:search] + '%' )
    end
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    @coupon.save
     redirect_to admin_coupon_path(@coupon.id)
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    @coupon = Coupon.find(params[:id])
    @coupon.update(coupon_params)
     redirect_to admin_coupon_path(@coupon.id)
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    redirect_to '/admin/coupons'
  end

  private

  def coupon_params
    params.require(:coupon).permit(:shop, :coupon_name, :content, :from_day, :to_day)
  end
end
