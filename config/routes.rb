Makemylifeeasy::Application.routes.draw do

  root :to => 'service_types#index'

  resources :resource_ratings

  resources :request_histories

  resources :request_schedules

  get 'orders' => 'requests#orders'

  get 'orders/:id/assign' => 'requests#assign', as: :assign
  get 'orders/:id/reject' => 'requests#reject', as: :reject
  get 'orders/:id/:st/service' => 'requests#service', as: :service

  patch 'orders/:id/statusupdate' => 'requests#statusupdate', as: :statusupdate

  get 'requests/:st_id/:s_id/new' => 'requests#new', as: :requests_new

  resources :requests

  resources :services

  resources :resource_services

  resources :resources

  resources :customers

  resources :service_types

  resources :locations

  devise_for :users,:controllers => { :registrations =>'registration'}

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
