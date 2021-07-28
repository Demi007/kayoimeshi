class Public::FavoritesController < ApplicationController
    before_action :authenticate_user!,except: [:create, :destroy]
    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        favorite = current_user.favorites.new(restaurant_id: @restaurant.id)
        favorite.save
    end
    
    def destroy
        @favorite = Favorite.find(params[:id])
        @restaurant = Restaurant.find(params[:restaurant_id])
        favorite = current_user.favorites.find_by(restaurant_id: @restaurant.id)
        favorite.destroy
    end
end
