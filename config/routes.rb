Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
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
