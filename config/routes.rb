Rails.application.routes.draw do
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      scope 'users' do
        post 'create', to: 'user#create', as: 'create_user'
        post 'login', to: 'user#login', as: 'login_user'
        delete 'destroy', to: 'user#destroy', as:'delete_user'
        put 'update', to: 'user#update', as:'update_user'
        get 'show/:id', to:'user#show', as:'show_user'
      end
    end
  end
end