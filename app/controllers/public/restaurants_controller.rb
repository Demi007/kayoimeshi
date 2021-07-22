class Public::RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end
    
    def show
        @restaurant = Restaurant.find(params[:id])
        @images = @restaurant.images
    end
    
    def search
      @restaurants = Restaurant.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    end
end
