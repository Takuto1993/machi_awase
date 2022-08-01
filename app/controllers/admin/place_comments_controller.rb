class Admin::PlaceCommentsController < ApplicationController

  def create
    place = Place.find(params[:place_id])
    comment = current_user.place_comments.new(place_comment_params)
    comment.place_id = place.id
    comment.save
    redirect_to admin_place_path(place)
  end

  def destroy
   PlaceComment.find(params[:id]).destroy
   redirect_to admin_place_path(params[:place_id])
  end

  private

  def place_comment_params
    params.require(:place_comment).permit(:comment)
  end

end
