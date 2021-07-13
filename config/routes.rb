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
    root :to => 'homes#top'
    resources :restaurants, only: [:index, :show] do
    resources :images, only: [:index, :show]
    resources :staffs, only: [:index]
    resource :favorites, only: [:index, :create, :destroy]
    resources :reviews, only: [:new, :index, :show, :edit, :update, :destroy]
   end
    resource :contacts, only: [:new, :create]
    get 'contacts/complete' => 'contacts#complete'
  end
  namespace :owner do
    resource :restaurants, only: [:show, :edit, :update] do
    resources :images, only: [:index, :show, :create, :update, :destroy]
    resources :reviews, only: [:index, :show]
    resources :staffs, only: [:new, :create, :index, :edit, :update, :destroy]
  end
    resource :contacts, only: [:new, :create]
    get 'contacts/complete' => 'contacts#complete'
  end
end
