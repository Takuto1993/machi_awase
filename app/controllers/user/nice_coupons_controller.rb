class User::NiceCouponsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @nice_coupons = current_user.nice_coupons.page(params[:page]).order(created_at: :desc)
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
