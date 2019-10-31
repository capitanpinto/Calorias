Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'static_pages/calories'
  devise_for :users
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
