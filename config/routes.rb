Rails.application.routes.draw do
  devise_for :restaurants, controllers: {
    sessions: 'restaurants/sessions',
    passwords: 'restaurants/passwords',
    registrations: 'restaurants/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root :to => 'restaurants#index'
    resources :restaurants, only: [:index, :show] do
      collection do
      get 'search'
    end
      resources :images, only: [:index]
      resources :favorites, only: [:create, :destroy]
      resources :reviews, only: [:new, :index, :edit, :update, :destroy, :create]
   end
    get 'user/favorites/:id' => 'users#favorites', as: 'user_favorites'
    get 'contacts/complete' => 'contacts#complete'
  end
  namespace :owner do
    resources :restaurants, only: [:show, :edit, :update] do
    resources :reviews, only: [:index]
    resources :images, only: [:index, :show, :create, :destroy]
    resources :staffs, only: [:new, :create, :index, :edit, :update, :destroy]
  end
    resource :contacts, only: [:new, :create]
    get 'contacts/complete' => 'contacts#complete'
  end
end
