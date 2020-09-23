Rails.application.routes.draw do
  resources :games
  resources :apps
  resources :websites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
