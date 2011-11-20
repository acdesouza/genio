Cartolla::Application.routes.draw do
  get "wishes/list"
  root :to => 'wishes#make'
end
