class Public::ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = current_user.reviews.new(review_params)
    @review.restaurant_id = @restaurant.id
    @review.score = Language.get_data(review_params[:comment])  #この行を追加
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    
    @review.update(review_params)
    redirect_to restaurant_reviews_path(@review.restaurant_id)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.page(params[:page]).per(15)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rate, :score)
  end
end
