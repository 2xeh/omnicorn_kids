Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  # if you make a categories controller, this would be the :show
  get '/products/category/:catid', to: 'products#category',
                                   as: 'category'

  # ie. like :show
  get '/products/item/:id', to: 'products#item',
                            as: 'product'

  # per richonrails.com
  resources :products, only: [:index]
  resource :cart, only: [:show]
  # note: whenever you use %i, [] should become ()
  resources :order_items, only: %i(create update destroy)

  # autogenerated routes for customer
  get 'customer/login'
  get 'customer/register'
  get 'customer/show'
  get 'customer/edit'
  get 'customer/deactivate'
end
