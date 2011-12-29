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

      resources :links do
        collection do
          get :available
        end 
        member do
          get :select
          get :remove
        end
      end

    end

    resources :labels
    resources :links
  end
end 
