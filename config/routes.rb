Letsgetpro::Application.routes.draw do
  resources :activities
  resources :companies
  resources :users
  resources :news
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/search',  to: 'home#search',          via: 'get'
  match '/remove_membership',  to: 'memberships#destroy',  via: 'get'
  match '/remove_pres',  to: 'memberships#remove_pres',  via: 'get'
  match '/remove_contact', to: 'contacts#destroy', via: 'get'
  match '/accept_contact', to: 'contacts#accept_contact', via: 'get'
  match '/reject_contact', to: 'contacts#reject_contact', via: 'get'
  match '/contact', to: 'home#contact', via: 'get'

  get "home/register"
  get "home/report"
  get "home/login"
  get "home/contacts"
  get "home/contact"
  get "home/search"
  get "home/company_list"
  get "home/company_cp"
  get "home/user_list"
  get "home/user_cp"
  get "home/about"
  get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'news#index'

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
