Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, controllers: { registrations: 'users/registrations' },
                     path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_takers, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
