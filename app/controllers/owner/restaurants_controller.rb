class Owner::RestaurantsController < ApplicationController
  def show
    @restaurant = current_restaurant
    @images = @restaurant.images
  end

  def edit
    @restaurant = current_restaurant
  end

  def update
    @restaurant = current_restaurant
    @restaurant.update(restaurant_params)
    redirect_to owner_restaurant_path(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :introduction, :announcement, :price_range, :open_morning, :open_noon, :open_night, :regular_holiday, :postal_code, :address)
  end
end
