Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/home'
  get 'homes/about'
  devise_for :users
  root 'homes#top'
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
