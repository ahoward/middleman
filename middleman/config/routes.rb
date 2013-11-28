Middleman::Application.routes.draw do
  get "bugs/index"

  resources :messages, :defaults => {:format => :json}
  resources :bugs
  root :to => 'messages#index'
end
