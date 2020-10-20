Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :accounts
      resources :images
      resources :reactions
      resources :posts
      resources :comments
    end
  end
end
