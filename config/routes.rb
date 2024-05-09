Rails.application.routes.draw do
  get 'departments/department_name'
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :profiles do
    get 'departments', to: 'profiles#departments_index'
  end
  resources :departments 
  get '/departments/:id/profiles', to: 'departments#profiles_index'
  
  resources :positions
  get '/positions/:id/profiles', to: 'positions#position_profiles_index'
end
