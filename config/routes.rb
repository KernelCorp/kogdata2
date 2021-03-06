Kogdata2::Application.routes.draw do

  root 'main#index'

  get '/my_requests', to: 'events#my_requests'

  resources :events do
    resources :event_requests, except: [:new, :edit, :update]
  end

  resources :conversations, only: [:create, :index, :show] do
    collection do
      post :create_with_user
    end
    resources :messages, except: [:new, :edit]
  end

  resources :photographer, only: [] do
    resources :portfolios, only: [:index, :destroy], shallow: true
  end
  resources :portfolios, only: [:create]

  devise_for :users, controllers: { registrations: :registrations }

  resources :users, only: :show do
    resources :events, only: [:index]
  end

  match 'auth/:provider/callback' => 'omniauth#start', via: [:get, :post]
  post 'auth/finish' => 'omniauth#finish'

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
