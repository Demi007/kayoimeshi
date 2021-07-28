class Public::UsersController < ApplicationController
  def favorites
    @favorites = current_user.favorites
  end
end
