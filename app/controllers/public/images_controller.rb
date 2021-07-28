class Public::ImagesController < ApplicationController
    def index
        @restaurant = Restaurant.find(params[:restaurant_id])
        @images = @restaurant.images
    end
    
    def show
        @image = Images.find(params[:id])
    end
end
