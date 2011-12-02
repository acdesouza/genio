Cartolla::Application.routes.draw do
  resources :products

  devise_for :users

  resources :wishes
  root :to => 'wishes#index'
end
