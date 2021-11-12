Rails.application.routes.draw do
  
  get 'users/index'
  devise_for :admins, controllers: {registrations: "registrations",sessions: "sessions"}


  get 'cities/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index" 
  

  resources :users 
  get 'user/ajax_form',                to: "users#ajax_form"
  post 'user/create_ajax_form_user', to: "users#create_ajax_form_user"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
