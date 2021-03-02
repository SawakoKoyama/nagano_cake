Rails.application.routes.draw do
  namespace :public do
    resources :addresses
    post 'orders/confirm'
    get 'orders/complete'
    resources :orders
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :customers
    get 'customers/my_page' => 'customer#show'
    delete 'cart_items/destroy_all'
    resources :cart_items
    resources :items
    root to: 'homes#top'
    get 'homes/about'
  end

  namespace :admin do
    resources :orders
    resources :customers
    resources :genres
    resources :items
  end

  root to: 'admin/homes#top'
  devise_for :admins,
  path: "admin", controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :customers,
  path: "customer", controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
end

