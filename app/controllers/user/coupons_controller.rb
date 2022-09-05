class User::CouponsController < ApplicationController
  def index
    #入力が無いときすべて表示
    if params[:search] == nil
      @coupons = Coupon.page(params[:page]).order(created_at: :desc)
    #入力に空白がある時はすべて表示
    elsif params[:search] == ' '
      @coupons = Coupon.page(params[:page]).order(created_at: :desc)
    #入力がある時に検索する文字に登録したカラムとヒットした場合
    else
      @coupons = Coupon.where("shop LIKE? OR coupon_name LIKE?", '%' + params[:search] + '%', '%' + params[:search] + '%' ).page(params[:page]).order(created_at: :desc)
    end
  end

  def show
    @coupon = Coupon.find(params[:id])
  end
end
