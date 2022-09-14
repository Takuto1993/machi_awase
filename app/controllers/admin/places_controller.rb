class Admin::PlacesController < ApplicationController

  before_action :authenticate_admin!

  def index
    if params[:search] == nil
      @places = Place.page(params[:page]).order(created_at: :desc)
    elsif params[:search] == '　'
      @places = Place.page(params[:page]).order(created_at: :desc)
    else
      @places = Place.where("subject LIKE? OR body LIKE? OR address LIKE? OR spot LIKE?", '%' + params[:search] + '%', '%' + params[:search] + '%', '%' + params[:search] + '%', '%' + params[:search] + '%' ).page(params[:page]).order(created_at: :desc)
    end
  end

  def show
    @place = Place.find(params[:id])
    @place_comment = PlaceComment.new
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
   @place = Place.find(params[:id])
   if @place.update(place_params)
    redirect_to admin_place_path(@place.id)
   else
    render :edit
   end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to '/admin/places'
  end

  private

  def place_params
    params.require(:place).permit(:subject, :body, :address, :latitude, :lingitube, :spot, :place_at)
  end
end
