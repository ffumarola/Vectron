Vectron::Application.routes.draw do
  get "message_content/index"

  get "message_content/create"

  get "message_content/show"

  get "message_content/edit"

  get "voucher_offer/show"

  get "voucher/create"

  get "voucher/show"

  get "voucher/edit"
  
  get "voucher/new"

  get "business/show"
  
  get "business/new"

  get "business/create"

  get "business/edit"

  get "consumer/home"

  get "consumer/create"

  get "consumer/edit"

  get "pages/home"

  get "pages/contact"

  get "pages/about"

  get "pages/help"
  
  resources :event_types
  
  resources :interest_levels
  
  resources :businesses
  
  resources :vouchers

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  namespace :user do
    root :to => "businesses#show"
  end
  
  root :to => 'pages#home'
  
  match '/home', :to => 'pages#home'
  match '/about', :to => 'pages#about'
  match '/abuse', :to => 'pages#abuse'
  match '/account', :to => 'pages#account'
  match '/contact', :to => 'pages#contact'
  match '/deal', :to => 'pages#deal'
  match '/dev', :to => 'pages#dev'
  match '/jobs', :to => 'pages#jobs'
  match '/landing', :to => 'pages#landing'
  match '/login', :to => 'pages#login'
  match '/privacy', :to => 'pages#privacy'
  match '/signup', :to => 'pages#signup'
  match '/terms', :to => 'pages#home'
  match '/home', :to => 'pages#home'
  
  
  #match '/business/home', :to => 'business#create'
  
  #match '/business/create',  :to => 'business#home'
  
  match '/businesses/home', :to => 'businesses#show'
  
  #match '/vouchers', :to => 'businesses#show'
  
  #match '/getvouchers', :to => 'vouchers#index'
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
