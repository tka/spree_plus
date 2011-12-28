Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :labels
    resources :links
  end 
end 
