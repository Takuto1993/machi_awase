class User::JoinPlacesController < ApplicationController
  
  def index
    @join_places = current_user.join_places
  end

  def create
    place = Place.find(params[:place_id])
    join_place = current_user.join_places.new(place_id: place.id)
    join_place.save
    redirect_to place_path(place)
  end

  def destroy
    place = Place.find(params[:place_id])
    join_place = current_user.join_places.find_by(place_id: place.id)
    join_place.destroy
    redirect_to place_path(place)
  end

end