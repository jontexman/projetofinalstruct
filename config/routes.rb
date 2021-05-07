Rails.application.routes.draw do
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      scope 'users' do
        post 'create', to: 'user#create', as: 'create_user'
        post 'login', to: 'user#login', as: 'login_user'
        delete 'destroy/:id', to: 'user#destroy', as:'delete_user'
        put 'update/:id', to: 'user#update', as:'update_user'
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

      scope 'game/' do
        get 'index', to:'game#index', as: 'games_index'
        get 'show/:id', to:'game#show', as: 'show_game'
        post 'create', to:'game#create', as: 'create_game'
        delete 'destroy/:id', to:'game#destroy', as: 'destroy_game'
        put 'update/:id', to:'game#update', as: 'update_game'
      end
      scope 'category/' do
        get 'index', to:'category#index', as: 'category_index'
        get 'show/:id', to:'category#show', as: 'show_category'
        post 'create', to:'category#create', as: 'create_category'
        delete 'destroy/:id', to:'category#destroy', as: 'destroy_categories'
        put 'update/:id', to:'category#update', as: 'update_categories'
        get 'games_categories/:id', to:'category#games_categories', as: 'games_categories'
      end

    end
  end
end