Rails.application.routes.draw do
  
  devise_for :users
  resources :projects do
  	resources :bugs
  end

  root to: 'projects#index'
end
