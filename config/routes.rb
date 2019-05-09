# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :projects do
  	member do
    	post "/add_user", to: 'projects#add_user'
    	post "/del_user", to: 'projects#del_user'
  	end
    resources :bugs
    
  end

  root to: 'projects#index'
end
