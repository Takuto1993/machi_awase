class User::PlacesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  
  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to place_path(@place.id)
    else
      render :new
    end
  end

  def index
    if params[:search] == nil
      @places = Place.page(params[:page]).order(created_at: :desc)
    elsif params[:search] == ' '
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
     redirect_to place_path(@place.id)
    else
     render :edit
    end
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
