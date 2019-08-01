Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show, :index, :create, :destroy, :update]
  resources :artworks, only:[:show, :create, :destroy, :update]
  resources :artwork_shares, only:[ :create, :destroy]
  
  resources :users do
    resources :artworks, only:[:index]
    resources :comments, only:[:index]
    member do 
      get 'owner_favorites'
    end
    member do
      get 'shared_favorites'
    end
  end
  
  resources :comments, only:[:create, :destroy]

  resources :artworks do
    resources :comments, only:[:index]
    member do 
      post 'favorite'
    end
  end

end

# artwoskshare/user_id/artwork_id