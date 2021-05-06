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
      scope 'publishers/' do
        get 'index', to:'publishers#index', as: 'publisher_index'
        get 'show/:id', to:'publishers#show', as: 'show_publisher'
        post 'create', to:'publishers#create', as: 'create_publisher'
        delete 'destroy/:id', to:'publishers#destroy', as: 'destroy_publisher'
        put 'update/:id', to:'publishers#update', as: 'update_publisher'
        get 'games_publishers/:id', to:'publishers#games_publishers', as: 'publishers_games'
      end
    end
  end
end