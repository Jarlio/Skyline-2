Rails.application.routes.draw do

  devise_for :users
  
  # resources :articles, only: %i[show update destroy create]

  resources :articles, only: %i[show update destroy create] do
    resources :paragraphs, only: %i[create edit update destroy]
    resources :tags, only: %i[new create destroy]
    resources :galleries, only: %i[create edit update destroy] do
      resources :images, only: %i[new create destroy]
    end
  end

  get '/error/:message', to: 'error#show', as: 'error'

  get '/user/:username', to: 'user#show', as: 'user_profile'
  post '/update_user', to: 'user#update', as: 'user_update'

  root 'welcome#index'
end
