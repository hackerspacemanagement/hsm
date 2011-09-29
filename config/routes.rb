Hsm::Application.routes.draw do
  devise_for :users

  resource :home

  root :to => 'home#index'

end
