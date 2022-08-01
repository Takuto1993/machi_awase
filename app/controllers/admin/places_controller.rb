class Admin::PlacesController < ApplicationController
  def index
    @places = Place.all
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
   @place.update(place_params)
   redirect_to admin_place_path(@place.id)
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
