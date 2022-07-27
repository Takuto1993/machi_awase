class User::PlacesController < ApplicationController
  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    @place.save
      redirect_to place_path(@place.id)
  end

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to place_path(@place.id)
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to '/places'
  end

  private

  def place_params
    params.require(:place).permit(:user_name, :subject, :body, :address, :latitude, :lingitube, :spot, :place_at)
  end
end
