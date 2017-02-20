class FavoritesController < ApplicationController
  def like
    pet = Pet.find(params[:pet_id])
    favorite = Favorite.create(pet: pet, user: current_user)
    render json: Pet.random
  end

  def index
    if session[:user_id].nil?
      redirect_to '/signup'
    else
      # user = User.find(session[:user_id])
      @favorites = current_user.favorites
    end
  end
end
