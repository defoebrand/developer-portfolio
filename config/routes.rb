# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all

  devise_scope :user do
    get '/users/sign_in', to: 'devise/sessions#new', as: :new_user_session
    post '/users/sign_in', to: 'devise/sessions#create', as: :user_session
    delete '/users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
    get '/users/password/new', to: 'devise/passwords#new', as: :new_user_password
    get '/users/password/edit', to: 'devise/passwords#edit', as: :edit_user_password
  end
  resources :games, except: [:show]
  resources :games, only: [:show], param: :title
  resources :apps, except: [:show]
  resources :apps, only: [:show], param: :title
  resources :websites, except: [:show]
  resources :websites, only: [:show], param: :title
  resources :portal
  get '/about', to: 'portal#about'
  get '/web_form', to: 'portal#web_form'
  post '/web_form', to: 'portal#web_form_send'
  get '/employee_form', to: 'portal#employee_form'
  post '/employee_form', to: 'portal#web_form_send'
  get '/tutor_form', to: 'portal#tutor_form'
  post '/tutor_form', to: 'portal#web_form_send'
  root 'portal#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
