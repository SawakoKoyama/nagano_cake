Rails.application.routes.draw do
  namespace :public do
    resources :addresses
  end
  namespace :public do
    post 'orders/confirm'
    get 'orders/complete'
    resources :orders
    
  end
  namespace :public do
    get 'customers/unsubscribe'
    resources :customers
  end
  namespace :public do
    delete 'cart_items/destroy_all'
    resources :cart_items
  end
  namespace :public do
    resources :items
  end
  namespace :public do
    root to: 'homes#top'
    get 'homes/about'
  end
  namespace :admin do
    resources :orders
  end
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :genres
  end
  namespace :admin do
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

