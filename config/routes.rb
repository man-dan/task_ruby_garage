TaskRubyGarage::Application.routes.draw do 
   resources :users
   resources :sessions, only: [:new, :create, :destroy]
   resources :view, only:[:index, :create, :destroy, :edit, :update]
   resources :tasks, only: [:create, :destroy, :edit, :update,:check,:uncheck]
   root 'view#index' 
   match '/signup',            to: 'users#new',          via: 'get'
   match '/signin',            to: 'sessions#new',       via: 'get'
   match '/signout',           to: 'sessions#destroy',   via: 'delete'
   match 'view/create',        to: 'view#create',        via: 'post'
   match 'view/destroy/:id',   to: 'view#destroy',       via: 'delete'
   match 'view/edit/:id',      to: 'view#edit',          via: 'get'
   match 'view/update/:id',    to: 'view#update',        via: 'patch'
   match 'tasks/update/:id',   to: 'tasks#update',       via: 'patch'
   match 'tasks/edit/:id',     to: 'tasks#edit',         via: 'get'
   match 'tasks/check/:id',    to: 'tasks#check',        via: 'get'
   match 'tasks/uncheck/:id',  to: 'tasks#uncheck',      via: 'get'
   match 'tasks/destroy/:id',  to: 'tasks#destroy',      via: 'delete'
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
