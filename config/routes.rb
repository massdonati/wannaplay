WannaPlay::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.
  root :to => "games#index"

  resources :games
  resources :comments, :only => [:index, :create, :update, :destroy, :edit, :new]
  resources :players, :only => [:index, :create, :update, :destroy, :edit, :new]
  end
