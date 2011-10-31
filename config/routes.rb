Hsm::Application.routes.draw do
  devise_for :users

  resource :home
  resources :tools

  root :to => 'home#index'

end
