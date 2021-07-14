class Public::StaffsController < ApplicationController
    def index
        @restaurant = Restourant.find(params[:id])
    end
end
