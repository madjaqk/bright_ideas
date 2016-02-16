Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  get 'ideas/index'

  get 'ideas/create'

  get 'ideas/new'

  get 'ideas/show'

  get 'ideas/destroy'

  get 'users/index'

  get 'main' => 'users#new'

  post 'users/create', as: "users"

  post '/login' => 'users#login'

  get '/bright_ideas' => 'ideas#index'

  delete '/logout' => 'users#logout'

  post 'ideas/create', as: "ideas"

  get '/users/:id' => "users#show"

  get '/like/:id' => "likes#create"

  get '/bright_ideas/:idea_id' => "ideas#show"

  delete '/ideas' => "ideas#destroy"

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
