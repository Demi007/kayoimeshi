class Public::ImagesController < ApplicationController
    def index
        @restaurant = Restaurant.find(params[:restaurant_id])
        @images = @restaurant.images
    end
    
    def show
        @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
