class Public::RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end
    
    def show
        @restaurant = Restaurant.find(params[:id])
    end
    
    def search
      @restaurants = Restaurant.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    end
end
