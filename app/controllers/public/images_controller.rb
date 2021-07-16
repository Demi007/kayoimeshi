class Public::ImagesController < ApplicationController
    def index
        @restaurant = Restaurant.find(params[:restaurant_id])
    end
    
    def show
        # @image = Image.find(params[:id])
    end
end
