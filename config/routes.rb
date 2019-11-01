Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'static_pages/calories'
  devise_for :users
  get '/search' => 'calos#search', :as => 'search_calo'
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :calos,          only: [:create, :destroy]
end
