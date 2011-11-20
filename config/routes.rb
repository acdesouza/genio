Cartolla::Application.routes.draw do
  get "wishes/show"
  root :to => 'wishes#make'
end
