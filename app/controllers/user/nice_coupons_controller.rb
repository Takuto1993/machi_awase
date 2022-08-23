class User::NiceCouponsController < ApplicationController
  def index
    #入力が無いときすべて表示
    if params[:search] == nil
      @nice_coupons = NiceCoupon.all
    #入力に空白がある時はすべて表示
    elsif params[:search] == ' '
      @nice_coupons = NiceCoupon.all
    #入力がある時に検索する文字に登録したカラムとヒットした場合
    else
      @nice_coupons = NiceCoupon.where("nice_coupon.shop LIKE? OR nice_coupon.coupon_name LIKE?", '%' + params[:search] + '%', '%' + params[:search] + '%' )
    end
  end

  def create
    coupon = Coupon.find(params[:coupon_id])
    nice_coupon = current_user.nice_coupons.new(coupon_id: coupon.id)
    nice_coupon.save
    redirect_to coupon_path(coupon)
  end

  def destroy
    coupon = Coupon.find(params[:coupon_id])
    nice_coupon = current_user.nice_coupons.find_by(coupon_id: coupon.id)
    nice_coupon.destroy
    redirect_to coupon_path(coupon)
  end

end
