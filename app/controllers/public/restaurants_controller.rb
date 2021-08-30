class Public::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(6)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @images = @restaurant.images
  end

  def search
    @restaurants = Restaurant.search(params[:keyword]).page(params[:page]).per(10)
    @keyword = params[:keyword]
    render "index"
  end
end
