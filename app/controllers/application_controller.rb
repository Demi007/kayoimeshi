class ApplicationController < ActionController::Base
    
    def after_sign_in_path_for(resource)
      case resource
      when Restaurant
        owner_restaurants_path
      when User
        restaurants_path
      end
    end
end
