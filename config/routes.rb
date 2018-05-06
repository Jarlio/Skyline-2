Rails.application.routes.draw do


  get '/article/:id', to: 'article#show', as: 'article'
  post '/article/create', to: 'article#create', as: 'article_new'

  devise_for :users

  get '/user/:username', to: 'user#show', as: 'user_profile'
  post '/update_user', to: 'user#update', as: 'user_update'

  root 'welcome#index'
end
