Rails.application.routes.draw do
  devise_for :users
  resources :games
  resources :apps
  resources :websites
  resources :portal
  get '/about', to: 'portal#about'
  get '/web_form', to: 'portal#web_form'
  post '/web_form', to: 'portal#web_form_send'
  get '/employee_form', to: 'portal#employee_form'
  get '/tutor_form', to: 'portal#tutor_form'
  root 'portal#index'
  # root 'index.html.erb'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
