Rails.application.routes.draw do
  devise_for :users
  resources :users_admin, :controller => 'users'
  
  resources :stylist_categories do
    member do
      get 'get_branches'
      get 'get_service_categories'
    end
  end
  resources :service_categories do
    member do
      get 'get_services'
    end 
  end 
  resources :customers
  resources :bookings
  resources :discounts do
    member do
      get 'get_branches'
      get 'get_service_categories'
      get 'get_services'
    end
  end
  resources :stylists do
    member do
      get 'get_branches'
      get 'get_service_categories'
      get 'get_stylist_categories'
    end
  end
  resources :services do
    member do
      get 'get_branches'
      get 'get_service_categories'
    end
    collection { post :import }
  end
  resources :branches do
    member do
      get 'get_service_categories'
    end
  end
  resources :salons do
    member do
      get 'get_branches'
    end
  end
  get '/services/:id/cart_item', to: 'services#cart_item'
  get '/services/:id/remove_cart_item', to: 'services#remove_cart_item'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'salons#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
