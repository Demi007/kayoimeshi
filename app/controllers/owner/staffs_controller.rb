class Owner::StaffsController < ApplicationController
    def new
        @staff = Staff.new
    end
    
    def create
        @staff = Staff.new(staff_params)
        @staff.restaurant_id = current_restaurant.id
        @staff.save
        redirect_to owner_staffs_path
    end
    
    def edit
        @staff = Staff.find(params[:id])
    end
    
    def update
        @staff = Staff.find(params[:id])
        @staff.update(staff_params)
        redirect_to owner_staffs_path
    end
    
    def destroy
    end
    
    def index
        @restaurant = current_restaurant
    end
    
    private
    
    def staff_params
        params.require(:staff).permit(:nick_name, :introduction)
    end
end
