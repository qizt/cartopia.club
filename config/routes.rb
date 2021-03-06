Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'home#index'

	get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
	delete 'logout'  => 'sessions#destroy'

	get		'/info/' => 'info#index', as: :info


	resources :users do
	  resources :favorites
	end
	resources :cars do
		resources :comments

	end

  get  '/users/:id/cars' => 'users#cars', as: :user_cars
  get  '/users/:id/favs' =>'users#favs', as: :user_favs

	get '/admin/cars' => 'admin#cars', as: :admin_cars
	get '/admin/users' => 'admin#users', as: :admin_users
  post '/cars/s/search' => 'cars#search', as: :cars_search


  # api
  get '/api/users' =>'api#users'
  get '/api/cars'  =>'api#cars'
  get '/api/carsfavs' => 'api#carsfavs'
  post '/api/cars' => 'api#create'
  get '/api/favs'  =>'api#favs'
  get '/api/favdestroy' => 'api#favsdestroy'
  post '/api/favs' => 'api#createfavs'
  get '/api/comments' =>'api#comments'
  post '/api/comments' => 'api#createcomments'
	get '/api/login' => 'api#login'
  post '/api/signup' => 'api#signup'
  get '/api/sort' => 'api#sort'


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
