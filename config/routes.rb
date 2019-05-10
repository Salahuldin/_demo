# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :projects do
  	member do
    	patch "/add_user", to: 'projects#add_user'
    	patch "/del_user", to: 'projects#del_user'
  	end
    resources :bugs do
    	member do
	    	patch "/assign_bug", to: 'bugs#assign_bug'
        patch "/mark_bug", to: 'bugs#mark_bug'

    	end
    end    
  end
  root to: 'projects#index'
end
