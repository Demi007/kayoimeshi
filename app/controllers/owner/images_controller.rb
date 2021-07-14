class Owner::ImagesController < ApplicationController
    def index
        @restaurant = current_restaurant
        @image = Image.new
    end
    
    def create
        @image = Image.new(image_params)
        @image.restaurant_id = current_restaurant.id
        @image.save
        redirect_to owner_restaurant_path(current_restaurant)
    end
    
    def show
        @image = Image.find(params[:id])
    end
    
    def destroy
        @image = Image.find(params[:id])
        @image.destroy
        redirect_to owner_images_path
    end
    
    private

     def image_params
        params.require(:image).permit(:img)
     end
end
