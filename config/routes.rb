Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            get 'photos/index'
            get 'photos/show'
            patch 'photos/add'
            get 'app/index'

            get 'phone/old_data'
            get 'phone/old_key'

            get 'old_phone/csv'

            post 'old/save_settings'
            get 'old/load_settings'
            post 'old/save_keys'
            get 'old/load_keys'
            post 'old/save_file'
        end
    end
    root 'main#index'
    get '/*path' => 'main#index'
end
