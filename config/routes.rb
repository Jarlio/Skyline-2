Rails.application.routes.draw do


  get 'paragraphs/create'

  get 'paragraphs/show'

  get 'paragraphs/update'

  # article
  get '/article/:id', to: 'article#show', as: 'article'
  post '/article/create', to: 'article#create', as: 'article_new'

  # paragraph
  post 'paragraph/create/:article_id', to: 'paragraph#create', as: 'paragraph_new'

  devise_for :users

  get '/user/:username', to: 'user#show', as: 'user_profile'
  post '/update_user', to: 'user#update', as: 'user_update'

  root 'welcome#index'
end
