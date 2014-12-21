Rails.application.routes.draw do
  resources :batches

  get 'session/login'

  get 'session/logout'

  get 'session/login_attempt'

  get 'session/home'

  get 'session/profile'

  get 'session/setting'

  get 'users/new'

  resources :carts

  resources :shopitem_images

  resources :shopitem_tags

  resources :shopitems

  resources :promotion_tags

  resources :promotions

  # Added by Victor Tang for Ver. 0.1 -- Start
  root :to => 'index#index'      # default index page routing
  match 'index', to: 'index#index', via: [:get, :post] # default index page routing #2
  match '/session_cart', to: 'carts#session_cart', :via => :get
  match '/add_to_cart', to: 'carts#add', :via => :post
  post 'users/create'
  post 'session/login_attempt'
  post 'session/logout'
  match  'index/:page(.:format)', to: 'index#index', via: [:get, :post]
  match 'index/add_to_cart/:item_id/:unit', to: 'index#add_to_cart', :via => :post
  
  # Added by Victor Tang for Ver. 0.1 -- End
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
