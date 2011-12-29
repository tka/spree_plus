Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :products do
      resources :labels do
        collection do
          get :available
        end 
        member do
          get :select
          get :remove
        end

      end
    end
    resources :links

    resources :labels
    resources :links
  end
end 
