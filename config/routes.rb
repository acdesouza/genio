Cartolla::Application.routes.draw do
  #devise_for :users, :skip => :all
  #root :to => "sessions#new"
  #post "/users/sign_in"    => "sessions#create"
  #delete "/users/sign_out" => "sessions#destroy"

  resources :products do
    get :autocomplete_product_name, :on => :collection
  end

  resources :wishes
  root :to => 'wishes#new'
end
