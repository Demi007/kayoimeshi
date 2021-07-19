class Public::ReviewsController < ApplicationController
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end
    
    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = current_user.reviews.new(review_params)
        @review.restaurant_id = @restaurant.id
        @review.save
        redirect_to restaurant_path(@restaurant)
    end
    
    def edit
        @review = Review.find(params[:review_id])
    end
    
    def update
    end
    
    def destoy
    end
    
    def index
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = @restaurant.reviews.find(:review_id)
    end
    

    private
    
    def review_params
         params.require(:review).permit(:comment, :rate)
    end
        
    
    
end
