Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'photos/index'
      get 'photos/show'
      patch 'photos/add'
      get 'app/index'

      get 'phone/csv'
      post 'phone/save_settings'
      get 'phone/load_settings'
      post 'phone/save_file'
    end
  end
  root 'main#index'
  get '/*path' => 'main#index'
end
