class Owner::ReviewsController < ApplicationController
    def index
        @restaurant = current_restaurant
        @reviews = @restaurant.reviews.page(params[:page]).per(15)
    end
end
