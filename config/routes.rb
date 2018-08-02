Rails.application.routes.draw do

  devise_for :users
  
  # resources :articles, only: %i[show update destroy create]

  resources :articles, only: %i[show update destroy create] do
    resources :comments, only: %i[create destroy]
    resources :ratings, only: %i[create update destroy]
    resources :paragraphs, only: %i[create edit update destroy]
    resources :tags, only: %i[new create destroy]
    resources :galleries, only: %i[create edit update destroy] do
      resources :images, only: %i[new create destroy]
    end
  end

  # search functionality
  get '/search_articles_by_tags', to: "articles#search_tag"
  get '/search_articles_by_title', to: "articles#search_title"
  get '/search_user', to: "user#search_user"

  get '/error/:message', to: 'error#show', as: 'error'

  get '/user/:username', to: 'user#show', as: 'user_profile'
  post '/update_user', to: 'user#update', as: 'user_update'

  root 'welcome#index'
end
