BackboneAndRails::Application.routes.draw do

  # get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  mount Doorkeeper::Engine => '/oauth'

  resources :sessions
  resources :users

  resources :movies, :only => [:create, :destroy, :index, :show] do
    collection do
      get :populate
    end
  end

  root to: 'movies#index'
end
