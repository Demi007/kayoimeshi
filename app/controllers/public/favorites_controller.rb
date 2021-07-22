class Public::FavoritesController < ApplicationController
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
    
    def index
        @user = current_user
        
    end
end
