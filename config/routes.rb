Rails.application.routes.draw do
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      post 'sign_in', to: 'user#sing_in', as:'sign_in'
    end
  end
end
