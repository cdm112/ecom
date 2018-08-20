Rails.application.routes.draw do

	post 'add_to_cart' => 'cart#add_to_cart'

	post 'cart_edit' => 'cart#cart_edit'

  get 'view_order' => 'cart#view_order'

  get 'checkout' => 'cart#checkout'

  devise_for :users
  
  root 'storefront#all_items'

  get 'categorical' => 'storefront#items_by_category'

  get 'branding' => 'storefront#items_by_brand'

  delete 'cart_delete' => 'cart#cart_delete'
  
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
