Rails.application.routes.draw do
  # article
  get '/article/:id', to: 'article#show', as: 'article'
  post '/article/create', to: 'article#create', as: 'article_new'

  # paragraph
  post 'paragraph/create/:article_id', to: 'paragraph#create', as: 'paragraph_new'
  post 'paragraph/delete/:id', to: 'paragraph#destroy', as: 'paragraph_delete'

  devise_for :users

  get '/user/:username', to: 'user#show', as: 'user_profile'
  post '/update_user', to: 'user#update', as: 'user_update'

  root 'welcome#index'
end
