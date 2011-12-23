Hsm::Application.routes.draw do

  get "administration/index"

  get "administration/users"

  get "administration/configuration"

  devise_for :users

  resource :home
  resources :tools
  resources :tool_categories
  resources :skills

  root :to => 'home#index'

end
