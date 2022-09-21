class Admin::CouponsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    if params[:search] == nil
      @coupons = Coupon.page(params[:page]).order(created_at: :desc)
    elsif params[:search] == ' '
      @coupons = Coupon.page(params[:page]).order(created_at: :desc)
    else
      @coupons = Coupon.where("shop LIKE? OR coupon_name LIKE?", '%' + params[:search] + '%', '%' + params[:search] + '%' ).page(params[:page]).order(created_at: :desc)
    end
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
     redirect_to admin_coupon_path(@coupon.id)
    else
      render :new
    end
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    @coupon = Coupon.find(params[:id])
    if @coupon.update(coupon_params)
     redirect_to admin_coupon_path(@coupon.id)
    else
      render :edit
    end
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
