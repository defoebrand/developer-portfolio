Rails.application.routes.draw do
  resources :games
  resources :apps
  resources :websites
  resources :portal
  get '/about', to: 'portal#about'
  root 'portal#index'
  # root 'index.html.erb'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
