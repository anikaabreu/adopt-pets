class FavoritesController < ApplicationController
  def like
    pet = Pet.find(params[:pet_id])
    # user = User.find(session[:user_id])
    favorite = Favorite.create(pet: pet, user: current_user)
    # if !user.favorites.nil?
    #   redirect_to '/'
    # else
    #   redirect_to '/signup'
    # end
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
