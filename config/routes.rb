Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'photos/index'
      get 'photos/show'
    end
  end
  root 'main#index'
  get '/*path' => 'main#index'
end
