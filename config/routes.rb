Cartolla::Application.routes.draw do
  resources :products do
    get :autocomplete_product_name, :on => :collection
  end

  devise_for :users

  resources :wishes
  root :to => 'wishes#index'
end
