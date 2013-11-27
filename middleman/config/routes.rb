Middleman::Application.routes.draw do
  resources :messages, :defaults => {:format => :json}
  root :to => 'messages#index'
end
