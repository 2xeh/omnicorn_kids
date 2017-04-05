Rails.application.routes.draw do
  get 'orders/add_item'

  get 'orders/cart'

  get 'orders/checkout'

  get 'orders/history'

  get 'orders/summary'

  get 'customer/login'

  get 'customer/register'

  get 'customer/show'

  get 'customer/edit'

  get 'customer/deactivate'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  get '/products/category/:catid', to: 'products#category',
                                as: 'category'
  get '/products/item/:id', to: 'products#item',
                            as: 'product'
  # get 'products/index'
  # get 'products/category'
  # get 'products/item'
end
