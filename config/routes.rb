Rails.application.routes.draw do

# home controller
	root 'homes#top'
	get 'home/about' => 'homes#about'

# books controller
	resources :books, only: [:index, :create, :show, :edit, :update, :destroy]

# users controller
	devise_for :users
	resources :users, only: [:show, :index, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end