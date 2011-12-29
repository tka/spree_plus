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

    resources :labels do
      post :update_positions, :on => :collection
    end
    resources :links do
      post :update_positions, :on => :collection
    end
  end
end 
