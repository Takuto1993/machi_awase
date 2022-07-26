class User::UsersController < ApplicationController
  def show
    @places = current_user.places
  end

  def edit
  end
end
