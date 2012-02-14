Hsm::Application.routes.draw do

  namespace :admin do
    root :to => 'home#admin'
    resources :roles
    resources :users
    resource :settings
  end

  devise_for :users

  resource :home
  resources :tools
  resources :tool_categories
  resources :users_skills
  resources :skills

  root :to => 'home#index'

  match 'newsfeed', :to => 'newsfeed#index'

end
