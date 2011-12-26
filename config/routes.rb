Hsm::Application.routes.draw do

  get "administration/index"
  
  get "administration/roles"

  get "administration/users"

  get "administration/configuration"

  devise_for :users

  resource :home
  resources :tools
  resources :tool_categories
  resources :users_skills
  resources :skills

  root :to => 'home#index'

end
