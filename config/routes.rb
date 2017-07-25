Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {sessions: 'users/sessions'}
  devise_scope :user do
    root 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/password/edit' => 'devise/passwords#edit'
  end
  get '/calendar' => 'calendars#index'
  patch 'leads/payments/update_contract' => 'leads#update_contract'
  post "/leads/:lead_id/photos/new" => 'leads#upload_photos'
  delete 'photos/:photo_id' => 'leads#delete_photo'

  resources :customers
  resources :projects
  resources :events
  resources :users
  resources :photos
  resources :letters
  resources :reports
  resources :leads do
    get '/lead-sheet' => 'leads#lead_sheet'
    patch 'lead_tasks' => 'users#tasks_table', defaults: {format: 'js'}
    patch 'user_leads' => 'users#leads_table', defaults: {format: 'js'}
    post '/upload_photos' => 'leads#upload_photos'
    resources :events
    resources :services
    resources :service_orders
    resources :job_site, defaults: {format: 'js'}
    #dragonfly and imagemagcik
    resources :photos
    #payments
    resources :payments, defaults: { format: 'js' }
    resources :projects do
      resources :tasks, defaults: { format: 'js' } do
        post '/update' => 'tasks#update'
      end
    end
    resources :comments
    post 'convert', :action => 'convert'
    resources :quotes do
      collection do
        post 'new', :action => 'create'
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
