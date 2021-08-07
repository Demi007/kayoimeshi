class Owner::ImagesController < ApplicationController
  def index
    @restaurant = current_restaurant
    @images = @restaurant.images
    @image = Image.new
  end

  def create
    @restaurant = current_restaurant
    @image = current_restaurant.images.new(image_params)
    @image.restaurant_id = @restaurant.id
    @image.save
    tags = Vision.get_image_data(@image.img)    
    tags.each do |tag|
      @image.tags.create(name: tag)
    end
    redirect_to owner_restaurant_path(current_restaurant)
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to owner_restaurant_images_path
  end

  private

  def image_params
    params.require(:image).permit(:img)
  end
end
