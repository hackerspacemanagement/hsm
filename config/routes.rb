Hsm::Application.routes.draw do

  namespace :admin do
    root :to => 'home#admin'
    resources :roles
    resources :users
    resource :settings
  end

  devise_for :users

  # user views
  resource :home
  resources :tools
  resources :users_skills
  resources :skills
  
  # admin views
  resources :tool_categories
  resources :settings
  resources :users
  resources :roles
  resources :administration

  root :to => 'home#index'

end
