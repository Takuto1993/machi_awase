class User::CouponsController < ApplicationController
  def index
    if params[:search] == nil
      @coupons = Coupon.page(params[:page]).order(created_at: :desc)
    elsif params[:search] == ' '
      @coupons = Coupon.page(params[:page]).order(created_at: :desc)
    else
      @coupons = Coupon.where("shop LIKE? OR coupon_name LIKE?", '%' + params[:search] + '%', '%' + params[:search] + '%' ).page(params[:page]).order(created_at: :desc)
    end
  end

  def show
    @coupon = Coupon.find(params[:id])
  end
end
