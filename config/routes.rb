Hsm::Application.routes.draw do
  devise_for :users

  resource :home
  resources :tools
  resources :tool_categories

  root :to => 'home#index'

end
