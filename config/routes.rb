Cartolla::Application.routes.draw do
  devise_for :users#, :skip => :all
  
  get 'users/:id/wishes' => 'wishes#user', :as => 'user_wishes'
  #root :to => "sessions#new"
  #post "/users/sign_in"    => "sessions#create"
  #delete "/users/sign_out" => "sessions#destroy"

  resources :products do
    get :autocomplete_product_name, :on => :collection
  end

  resources :wishes

  get   'wishes/:wish_id/bids/new'  => 'bids#new', :as => 'make_a_bid_for_wish'
  post  'bids'                      => 'bids#create'

  root :to => 'wishes#new'
end
