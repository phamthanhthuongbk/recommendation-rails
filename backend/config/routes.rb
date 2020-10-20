Rails.application.routes.draw do
  resources :users do 
    member do
      get :add_friend
    end
  end
end
