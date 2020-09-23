Rails.application.routes.draw do
  resources :games
  resources :apps
  resources :websites
  resources :portal
  root 'portal#index'
  # root 'index.html.erb'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
